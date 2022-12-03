import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smart_commando/components/myoval_gradient_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class TriggerAction extends StatefulWidget {
  const TriggerAction({Key? key}) : super(key: key);

  @override
  _TriggerActionState createState() => _TriggerActionState();
}

class _TriggerActionState extends State<TriggerAction> {
  final _formKey = GlobalKey<FormState>();

  _emailFailure(context) {
    Navigator.pop(context);
  }

  String email = '';
  String error = '';

  Future popUp(bool status) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Container(
          height: 170,
          child: Center(
            child: Column(
              children: [
                Icon(
                  status == true ? Icons.done_all_rounded : Icons.dangerous,
                  color: status == true ? Colors.green : Colors.red,
                  size: 93,
                ),
                Text(
                  status == true
                      ? 'Email Sent Successfully'
                      : 'Please wait for some seconds before you' +
                          'will request for another reset link  ',
                  style: TextStyle(fontSize: 15, fontFamily: 'Roboto'),
                ),
                SizedBox(height: 4),
                RaisedButton(
                  child: Text(
                    status == true ? 'OK' : 'Re-enter email',
                    style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
                  ),
                  color: status == true ? const Color(0xff2FCA7C) : Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => {
                    status == true
                        ? _emailFailure(context)
                        : _emailFailure(context)
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 329.0),
      child: Card(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(left: 1, top: 30, right: 1, bottom: 20),
          margin: EdgeInsets.only(top: Constants.avatarRadius * 0.1),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Constants.padding)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    'Trigger Action',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto'),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            PinCodeTextField(
                              length: 4,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.white,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              enableActiveFill: true,
                              // errorAnimationController: errorController,
                              // controller: textEditingController,
                              onCompleted: (v) {
                                print("Completed");
                              },
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  // currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                              appContext: context,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 10),
                                child: MyOvalGradientButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 60,
                                  firstcolor: Colors.red,
                                  secondcolor: Colors.red,
                                  pressed: () {},
                                  placeHolder: 'Blow Tear Gas',
                                ))
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
