import 'package:flutter/material.dart';
import 'package:smart_commando/components/gradient_text.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/components/radiantgradient_mask.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/services/auth_service.dart';

class ProfileList extends StatefulWidget {
  String? name;
  String? nameField;
  IconData? leading;
  IconData? suffix;
  String? imageUrl;
  ProfileList(
      {@required this.name,
      this.nameField,
      @required this.leading,
      this.suffix,
      this.imageUrl});
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  bool textFieldState = false;
  String textValuetoUpdate = '';
  final _formKey = GlobalKey<FormState>();

  var error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context){
        //     return ChatDetail();
        //   }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(widget.imageUrl!) ,
                  //   maxRadius: 30,
                  // ),
                  RadiantGradientMask(
                      child: Icon(
                    widget.leading,
                    size: 30,
                    color: Colors.white,
                  )),

                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.transparent,
                        child: Text(
                          widget.name!,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )),
                  ),
                  RadiantGradientMask(
                      child: IconButton(
                    icon: Icon(
                      widget.suffix,
                      size: 30,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      buildEditPopup();
                    },
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
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
              height: 277,
              // constraints: BoxConstraints(ma),
              // padding: EdgeInsets.all(20),
              child: Center(
                  child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      'Edit Profile',
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
                        hintText: widget.name!,
                        validator: (val) =>
                            val!.isEmpty ? 'Enter a value' : null,
                        onChanged: (val) {
                          setState(() => textValuetoUpdate = val);
                        },
                      ),
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                    MyButton(
                      placeHolder: 'Update',
                      pressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var user = await AuthService().getuserFromStorage();
                          var dataToUpdate = {
                            widget.nameField!: textValuetoUpdate,
                            'token': user.token!,
                          };
                          var response = await AuthService()
                              .updateUser(dataToupdate: dataToUpdate);

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
