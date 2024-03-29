import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  bool ledstatus = false; //boolean value to track LED status, if its ON or OFF
  late IOWebSocketChannel channel;
  bool connected = false; //boolean value to track if WebSocket is connected
  channelconnect() {
    print('chanel connedcted is ran');
    //function to connect
    try {
      channel = IOWebSocketChannel.connect(
          "ws://192.168.98.222:80"); //channel IP : Port
      channel.stream.listen(
        (message) {
          print(message);
          setState(() {
            if (message == "connected") {
              connected = true; //message is "connected" from NodeMCU
            } else if (message == "poweron:success") {
              ledstatus = true;
            } else if (message == "poweroff:success") {
              ledstatus = false;
            }
          });
        },
        onDone: () {
          //if WebSocket is disconnected
          print("Web socket is closed");
          setState(() {
            connected = false;
          });
        },
        onError: (error) {
          print(error.toString());
        },
      );
    } catch (_) {
      print("error on connecting to websocket.");
    }
  }

  @override
  void initState() {
    ledstatus = false; //initially leadstatus is off so its FALSE
    connected = false; //initially connection status is "NO" so its FALSE

    // Future.delayed(Duration.zero, () async {
    channelconnect(); //connect to WebSocket wth NodeMCU
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("LED - ON/OFF NodeMCU"),
          backgroundColor: Colors.redAccent),
      body: Container(
          alignment: Alignment.topCenter, //inner widget alignment to center
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                  child: connected
                      ? Text("WEBSOCKET: CONNECTED")
                      : Text("DISCONNECTED")),
              Container(
                  child: ledstatus ? Text("LED IS: ON") : Text("LED IS: OFF")),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                      //button to start scanning
                      // color: Colors.redAccent,
                      // colorBrightness: Brightness.dark,
                      onPressed: () {
                        print('printend');
                        //on button press
                        if (ledstatus) {
                          //if ledstatus is true, then turn off the led
                          //if led is on, turn off
                          // sendcmd("poweroff");
                          ledstatus = false;
                        } else {
                          //if ledstatus is false, then turn on the led
                          //if led is off, turn on
                          // sendcmd("poweron");
                          ledstatus = true;
                        }
                        setState(() {});
                      },
                      child: ledstatus
                          ? Text("TURN LED OFF")
                          : Text("TURN LED ON")))
            ],
          )),
    );
  }
}
