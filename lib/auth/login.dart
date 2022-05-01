import 'package:flutter/material.dart';
import 'package:smart_commando/auth/registration/name_page.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/myoval_gradient_button.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/constants/my_navigate.dart';

import '../home_page.dart';
class Login extends StatefulWidget {
   Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
               Positioned(
                top: -118,
                left: -116,
                child: Image.asset(
                  'assets/downcurve.png',
                  width:size.height * 0.805,
                  height:370,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:148.0,bottom: 187),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   MyFormWidget(name: 'Login', image: 'smart_commando2.png'),
                   Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:20.0,top: 10,right: 20),
                            child: MyTextField(
                            validator: (val)=> val!.isEmpty ? 'Please Enter an address' : null,
                            hintText: 'Enter address',
                            keyboardType:TextInputType.name,
                            autovalidate: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20.0,top: 10,right: 20),
                            child: MyTextField(
                            validator: (val)=> val!.isEmpty ? 'Please Enter an address' : null,
                            hintText: 'Enter address',
                            keyboardType:TextInputType.name,
                            autovalidate: false,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:8.0,top: 10),
                            child: MyOvalGradientButton(
                              width: MediaQuery.of(context).size.width* 0.9,
                              height: 60,
                              
                              firstcolor: myBrownGradient[1],
                              secondcolor: myBrownGradient[0],
                              pressed: (){
                                  // if(_formKey.currentState!.validate()){                                    
                                    MyNavigate.navigatejustpush(HomePage(), context);
                                    
                                      // }
                              } ,
                                placeHolder: 'Login',
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -188,
                right: -146,
                child: Image.asset(
                  'assets/upcurve.png',
                  width:size.height * 0.905,
                  height:380,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}