import 'package:flutter/material.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/constants/constant.dart';

import 'name_page.dart';

class MainReg extends StatefulWidget {
  final controller;

  const MainReg({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<MainReg> createState() => _MainRegState();
}

class _MainRegState extends State<MainReg> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: MyFormWidget(name: 'Register', image: 'smart_commando2.png'),
        ),
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                child: MyTextField(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter an address' : null,
                  hintText: 'Enter email',
                  keyboardType: TextInputType.name,
                  autovalidate: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                child: MyTextField(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter password' : null,
                  hintText: 'Enter password',
                  keyboardType: TextInputType.name,
                  autovalidate: false,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 10),
                  child: MyButton(
                    height: 60,
                    pressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.controller.nextPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                      }
                    },
                    placeHolder: 'Continue',
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
