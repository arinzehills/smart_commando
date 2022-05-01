import 'package:flutter/material.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/myoval_gradient_button.dart';
import 'package:smart_commando/components/mypop_widget.dart';
import 'package:smart_commando/constants/constant.dart';

import 'name_page.dart';

class AddressPage extends StatefulWidget {
    final controller;

  const AddressPage({ Key? key,
          required this.controller, }) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyFormWidget(name: 'Register', image: 'camera.png'),
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
                  padding: EdgeInsets.only(left:8.0,top: 10),
                  child: MyOvalGradientButton(
                    width: MediaQuery.of(context).size.width* 0.9,
                    height: 60,
                    firstcolor: myBrownGradient[1],
                    secondcolor: myBrownGradient[0],
                    pressed: (){
                        if(_formKey.currentState!.validate()){
                            widget.controller.nextPage(
                            duration: Duration(milliseconds: 1000),
                               curve: Curves.easeIn
                            );
                             
                            }
                    } ,
                      placeHolder: 'Continue',
                  )
                ),
              ],
            ),
          ),
      ],
    );
  }
}