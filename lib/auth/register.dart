import 'package:flutter/material.dart';
import 'package:smart_commando/auth/login.dart';
import 'package:smart_commando/auth/registration/name_page.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/components/no_account.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/constants/my_navigate.dart';

import '../home_page.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -105,
              left: -116,
              child: Image.asset(
                'assets/downcurve.png',
                width: size.height * 0.805,
                height: 370,
              ),
            ),
            Positioned(
              bottom: -96,
              right: -146,
              child: Image.asset(
                'assets/upcurve.png',
                width: size.height * 0.905,
                height: 380,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 148.0, bottom: 187),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFormWidget(name: 'Register', image: 'smart_commando2.png'),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 30, right: 20),
                          child: MyTextField(
                            validator: (val) =>
                                val!.isEmpty ? 'Please Enter an address' : null,
                            hintText: 'Enter full name',
                            keyboardType: TextInputType.name,
                            autovalidate: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 30, right: 20),
                          child: MyTextField(
                            validator: (val) =>
                                val!.isEmpty ? 'Please Enter an address' : null,
                            hintText: 'Enter email',
                            keyboardType: TextInputType.name,
                            autovalidate: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 30, right: 20),
                          child: MyTextField(
                            validator: (val) =>
                                val!.isEmpty ? 'Please Enter an address' : null,
                            hintText: 'Enter home address',
                            keyboardType: TextInputType.name,
                            autovalidate: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 30, right: 20),
                          child: MyTextField(
                            validator: (val) =>
                                val!.isEmpty ? 'Please Enter an address' : null,
                            hintText: 'Enter password',
                            keyboardType: TextInputType.name,
                            autovalidate: false,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 30),
                            child: MyButton(
                              // width: MediaQuery.of(context).size.width * 0.9,
                              height: 55,
                              isGradientButton: true,
                              isOval: true,
                              gradientColors: myPinkGradient,
                              pressed: () {
                                // if(_formKey.currentState!.validate()){
                                MyNavigate.navigatejustpush(
                                    HomePage(), context);

                                // }
                              },
                              placeHolder: 'Register',
                            )),
                        Padding(
                          padding: EdgeInsets.only(right: 18.0, top: 10),
                          child: NoAccount(
                            title: 'Already have an account?',
                            subtitle: 'Login',
                            pressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                  (Route<dynamic> route) => false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
