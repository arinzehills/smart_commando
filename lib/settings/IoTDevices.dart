import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:smart_commando/components/gradient_text.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/components/normal_curve_container.dart';
import 'package:smart_commando/components/radiantgradient_mask.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/services/auth_service.dart';
import 'package:smart_commando/services/iot_service.dart';
import 'package:wifi_iot/wifi_iot.dart';

class IoTDevices extends StatefulWidget {
  const IoTDevices({Key? key}) : super(key: key);

  @override
  State<IoTDevices> createState() => _IoTDevicesState();
}

class _IoTDevicesState extends State<IoTDevices> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String password = '';
  String wifi_name = '';
  var error = '';

  bool _isConnected = false;
  bool _isEnabled = false;

  @override
  initState() {
    if (this.mounted) {
      WiFiForIoTPlugin.isEnabled().then((val) {
        _isEnabled = val;
      });
      WiFiForIoTPlugin.isConnected().then((val) {
        setState(() {
          _isConnected = val;
        });
        print('val');
        print(val);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    print(_isConnected);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: iconsColor,
        onPressed: () => {buildEditPopup()},
        child: RadiantGradientMask(
            child: Icon(
          Icons.add,
          size: 32,
        )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            NormalCurveContainer(
              size: size(context),
              height: size(context).height * 0.24,
              pagetitle: 'IoT Devices',
              widget: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    "Add IOT devices with by their respective Wi-fi",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size(context).height * 0.18),
              child: Center(
                child: Column(
                  children: _isConnected
                      ? [
                          Text(
                            "Connected to wifi",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.wifi,
                            size: 150,
                            color: Colors.greenAccent,
                          ),
                          Text(
                            _isConnected ? "Credentials" : '',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FutureBuilder(
                              future: WiFiForIoTPlugin.getSSID(),
                              initialData: "Loading..",
                              builder: (BuildContext context,
                                  AsyncSnapshot<String?> ssid) {
                                return Text("SSID: ${ssid.data}");
                              }),
                          FutureBuilder(
                              future: WiFiForIoTPlugin.getBSSID(),
                              initialData: "Loading..",
                              builder: (BuildContext context,
                                  AsyncSnapshot<String?> bssid) {
                                return Text("BSSID: ${bssid.data}");
                              }),
                          FutureBuilder(
                              future: WiFiForIoTPlugin.getIP(),
                              initialData: "Loading..",
                              builder: (BuildContext context,
                                  AsyncSnapshot<String?> ip) {
                                return Text("IP : ${ip.data}");
                              }),
                        ]
                      : [
                          Text(
                            'No Wi-Fi connected to',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.portable_wifi_off,
                            size: 150,
                            color: Color.fromARGB(255, 190, 207, 215),
                          ),
                        ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future buildEditPopup() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 377,
              // constraints: BoxConstraints(ma),
              // padding: EdgeInsets.all(20),
              child: Center(
                  child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      'Add IoT Device',
                      gradient: LinearGradient(colors: myPinkGradient),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    loading
                        ? CircularProgressIndicator(
                            color: myPinkGradient[1],
                          )
                        : Image.asset(
                            'assets/welcome-woman.jpg',
                            height: 65,
                            width: 90,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                      child: MyTextField(
                        hintText: 'Add Wi-Fi Name ',
                        validator: (val) =>
                            val!.isEmpty ? 'Enter a value' : null,
                        onChanged: (val) {
                          setState(() => wifi_name = val);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                      child: MyTextField(
                        hintText: 'Add password ',
                        validator: (val) =>
                            val!.isEmpty ? 'Enter a value' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                    MyButton(
                      placeHolder: 'Add',
                      loadingState: loading,
                      pressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var response =
                              await IotService().addWifi(wifi_name, password);
                          print(response);
                          print(response['message']);
                          if (response['success'] == true) {
                            setState(() => {});
                            Navigator.pop(context);
                            // snackBar(
                            //     BottomNavigation(
                            //       index: 5,
                            //     ),
                            //     context,
                            //     'Updated successfully');
                          } else {
                            setState(() => loading = false);
                            setState(() => error = response['message']);
                          }
                        }
                      },
                      isGradientButton: true,
                      gradientColors: myPinkGradient,
                    )
                  ],
                ),
              )),
            ),
          );
        });
  }
}
