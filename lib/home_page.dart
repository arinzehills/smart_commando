import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:smart_commando/components/drawer.dart';
import 'package:smart_commando/components/gradient_text.dart';
import 'package:smart_commando/components/myappbar.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/components/mymenu.dart';
import 'package:smart_commando/components/utilitiescomponents/loading.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/main.dart';
import 'package:smart_commando/models/camera_model.dart';
import 'package:flutter/services.dart';
import 'package:smart_commando/services/camera_service.dart';
import 'package:smart_commando/trigger_action.dart';
import 'package:smart_commando/video/network_player.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:developer' as developer;
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showCamera = false;
  bool loading = false;
  bool _isConnected = false;
  bool _isEnabled = false;
  String _connectionStatus = 'Unknown';
  late List<Camera> _camera;
  String? wifiName, wifiBSSID, wifiIPv4;

  void initState() {
    getCameraUrl();
    // var index = widget.index;
    WiFiForIoTPlugin.isEnabled().then((val) {
      _isEnabled = val;
    });
    WiFiForIoTPlugin.isConnected().then((val) {
      _isConnected = val;
      print('val');
      print(val);
    });
    _initNetworkInfo();
    super.initState();
  }

  Future<void> _initNetworkInfo() async {
    wifiName = await WiFiForIoTPlugin.getSSID();
    wifiBSSID = await WiFiForIoTPlugin.getBSSID();
    wifiIPv4 = await WiFiForIoTPlugin.getIP();

    setState(() {
      _connectionStatus = 'Wifi Name: $wifiName\n'
          'Wifi BSSID: $wifiBSSID\n'
          'Wifi IPv4: $wifiIPv4\n';
    });
  }

  Future<void> _connectToEspDevice() async {}

  Future getCameraUrl() async {
    setState(() => loading = true);
    this._camera = await CameraService().getAllCameras();
    setState(() => loading = false);
  }

  // void executeEsptouch() {
  //   final Stream<ESPTouchResult>? stream = EsptouchSmartconfig.run(
  //     ssid: wifiName!,
  //     bssid: wifiBSSID!,
  //     password: 'hills140',
  //   );
  //   final sub = stream!.listen((r) => print(
  //       'Device has been connected to Wifi with IP: ${r.ip} MAC: ${r.bssid}'));
  //   Future.delayed(Duration(minutes: 1), () => sub.cancel());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: MyMenu(),
        drawer: MyDrawer(),
        appBar: MyAppMenuBar(title: 'Home'),
        body: Stack(
          children: [
            Positioned(
              bottom: 16,
              right: -2,
              child: Image.asset(
                'assets/smarthome.jpg',
                width: size(context).height * 0.905,
                height: size(context).height * 0.9,
              ),
            ),
            Positioned(
                top: 10,
                right: 0,
                left: 0,
                child: Container(
                  decoration: myBoxDecoration(),
                  child: Column(
                    children: _isConnected
                        ? [
                            Text('Connected to\n' + _connectionStatus),
                            Icon(
                              Icons.wifi,
                              size: 100,
                              color: Colors.greenAccent,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('Let\'s go!'),
                            ),
                          ]
                        : [
                            Text('You are not connected to any wifi'),
                            Icon(
                              Icons.portable_wifi_off,
                              size: 100,
                              color: Color.fromARGB(255, 190, 207, 215),
                            ),
                          ],
                  ),
                )),
            showCamera
                ? Positioned(
                    bottom: size(context).height * 0.35,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            'Your Home View',
                            overflow: TextOverflow.visible,
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ),
                        NetworkPlayerWidget(
                            videoName: 'widget.videoName',
                            onShowCamera: () => {
                                  setState(() => {showCamera = false})
                                },
                            videoUrl: 'http://10.183.158.192:8080/video'
                            // videoUrl: _camera.first.rstp_url
                            // 'http://88.53.197.250/axis-cgi/mjpg/video.cgi?resolution=320x240',
                            ),
                      ],
                    ),
                  )
                : Container(),
            Positioned(
              bottom: 56,
              right: size(context).width * 0.3,
              child: MyButton(
                placeHolder: showCamera ? 'Fire' : 'View Room',
                isGradientButton: true,
                gradientColors: [
                  Color.fromARGB(255, 252, 190, 6),
                  Color.fromARGB(255, 255, 4, 255)
                ],
                pressed: () => !showCamera
                    ? {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return TriggerAction();
                            }),
                        setState(() => showCamera = !showCamera)
                      }
                    : {setState(() => showCamera = !showCamera)},
                isOval: true,
                widthRatio: 0.4,
              ),
            ),
          ],
        ));
  }
}
