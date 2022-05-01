import 'package:flutter/material.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/myoval_gradient_button.dart';
import 'package:smart_commando/constants/constant.dart';

class NamePage extends StatefulWidget {
    final controller;

   NamePage({ Key? key,
          required this.controller,
   }) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyFormWidget(name: 'Register', image: 'smart_commando2.png'),
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 10,right: 20),
                  child: MyTextField(
                  validator: (val)=> val!.isEmpty ? 'Please Enter a Name' : null,
                  hintText: 'Enter name',
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

class MyFormWidget extends StatelessWidget {
   MyFormWidget({
    Key? key,
    required this.name,
    required this.image,
    //  required this.pressed,
    //  this.widget,
  }) : super(key: key);

  final String? name;
  final String? image;
  // final VoidCallback pressed;
  // final Widget? widget;

  @override
  Widget build(BuildContext context) {
  final _formKey = GlobalKey<FormState>();

  return
  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name ?? '',
          style: TextStyle(
            color: myBrown,
            fontSize: 25,
          ),
        ),
        Container(
                    padding: EdgeInsets.all(0.0),
                    height: 150,
                     child:
                      Image.asset('assets/$image' )
                ),
              
      ],
    );
  }
}