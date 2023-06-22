import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:smart_commando/auth/register.dart';
import 'package:smart_commando/auth/registration/name_page.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/components/no_account.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/constants/my_navigate.dart';
import 'package:smart_commando/services/auth_service.dart';

import '../home_page.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  bool obscureText = false;
  String password = '';

  bool loading = false;

  String email = '';

  var error = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          // overflow: Overflow.visible,
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
              bottom: -256,
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
                  MyFormWidget(name: 'Login', image: 'smart_commando2.png'),
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
                            hintText: 'Enter address',
                            keyboardType: TextInputType.name,
                            autovalidate: false,
                            onChanged: (val) {
                              if (mounted) {
                                setState(() => email = val);
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 30, right: 20),
                          child: MyTextField(
                            hintText: 'Enter address',
                            keyboardType: TextInputType.visiblePassword,
                            autovalidate: false,
                            onChanged: (val) {
                              if (mounted) {
                                setState(() => password = val);
                              }
                            },
                            obscureText: obscureText,
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Required'),
                              MinLengthValidator(3,
                                  errorText:
                                      'Password must be at least 3 character long'),
                            ]),
                            suffixIconButton: IconButton(
                              icon: const Icon(Icons.visibility),
                              color: mypink,
                              onPressed: () {
                                if (obscureText == true) {
                                  setState(() {
                                    obscureText = false;
                                  });
                                } else {
                                  setState(() {
                                    obscureText = true;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 30),
                            child: MyButton(
                              // width: MediaQuery.of(context).size.width * 0.9,
                              height: 55,
                              isGradientButton: true,
                              isOval: true,
                              gradientColors: myPinkGradient,
                              pressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  var response = await AuthService()
                                      .login(email, password);
                                  print(response['success']);
                                  if (response['success'] == true) {
                                    setState(() => {});
                                    snackBar(HomePage(), context,
                                        'Logged in successfully');
                                  } else {
                                    setState(() => loading = false);
                                    setState(() => error = response['message']);
                                  }
                                }
                              },
                              placeHolder: 'Login',
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 18.0,
                          ),
                          child: NoAccount(
                            title: 'Already have an account?',
                            subtitle: 'REGISTER',
                            pressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
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
