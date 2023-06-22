import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_commando/components/custom_sliver_delegate.dart';
import 'package:smart_commando/components/gradient_text.dart';
import 'package:smart_commando/components/my_text_field.dart';
import 'package:smart_commando/components/mybutton.dart';
import 'package:smart_commando/components/mylist_container.dart';
import 'package:smart_commando/components/radiantgradient_mask.dart';
import 'package:smart_commando/components/utilitiescomponents/loading.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/models/camera_model.dart';
import 'package:smart_commando/services/auth_service.dart';
import 'package:smart_commando/services/camera_service.dart';

class ServeilanceCameras extends StatefulWidget {
  const ServeilanceCameras({
    Key? key,
  }) : super(key: key);

  @override
  _ServeilanceCamerasState createState() => _ServeilanceCamerasState();
}

class _ServeilanceCamerasState extends State<ServeilanceCameras> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String camera = '';
  var error = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // ServeilanceCamerasService.ServeilanceCamerasInstance;

    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int empty = 0;
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
      // drawer: MyDrawer(),
      body: SafeArea(
        child: Stack(children: [
          FutureBuilder<List<Camera>>(
              future: CameraService().getAllCameras(),
              builder: (context, AsyncSnapshot snapshot) {
                // snapshot.connectionState
                print('snapshot.data');
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Loading();
                }

                return CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: CustomSliverDelegate(
                        expandedHeight: 149,
                        showLogo: false,
                        aligncontainerwidget: MyListContainer(
                          title: 'Total Serveilance Cameras',
                          // sub_title: snapshot.data!.size.toString(),
                          sub_title: snapshot.data.length.toString(),
                          titleColor: Colors.black,
                          subtitleColor: Colors.black,
                        ),
                        showaligncontainerwidget: true,
                        title: 'Serveillance Cameras history',
                        alignment: Alignment(0.0, 1.40),
                        curveContainerHeight: size.height * 0.33,
                        widget1: Padding(
                          padding: const EdgeInsets.only(left: 33.0, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: GradientText("Hi Chris",
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.white, Colors.grey],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Center(
                        child: snapshot.data.length == 0
                            ? Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.140),
                                child: Container(
                                    height: size.height * 0.31,
                                    width: size.width * 0.7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                myLightBrown.withOpacity(0.24),
                                            spreadRadius: 15,
                                            blurRadius: 50,
                                            offset: Offset(0,
                                                9), // changes position of shadow
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white,
                                              Colors.white
                                            ])),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            child: Image.asset(
                                              "assets/smart_commando.png",
                                              height: 160,
                                            )),
                                        Text(
                                          ' No ServeilanceCamerass yet',
                                        )
                                      ],
                                    )),
                              )
                            : Wrap(
                                children: [
                                  Container(
                                    height: 50,
                                  ),
                                  ListView.builder(
                                      itemCount: snapshot.data.length,
                                      shrinkWrap: true,
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        Camera camera = snapshot.data[index];
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 30, right: 30),
                                          child: GestureDetector(
                                            onTap: () {
                                              // MyNavigate.navigatejustpush(UploadListPage(isUser:false,), context);
                                            },
                                            child: Container(
                                                height: 90,
                                                width: size.width * 0.85,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          blurRadius: 30,
                                                          spreadRadius: 0,
                                                          offset:
                                                              Offset(10, 30))
                                                    ]),
                                                child: MyListContainer(
                                                  title: 'Camera $index',
                                                  //title: 'Buy Units:34 ',
                                                  titleColor: Colors.black,
                                                  sub_title: camera.rstp_url,
                                                )),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                      ),
                    ),
                  ],
                );
              }),
        ]),
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
                      'Add IP Camera',
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
                        hintText: 'Add your camera rstp url ',
                        validator: (val) =>
                            val!.isEmpty ? 'Enter a value' : null,
                        onChanged: (val) {
                          setState(() => camera = val);
                        },
                      ),
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                    MyButton(
                      placeHolder: 'Add',
                      pressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var user = await AuthService().getuserFromStorage();
                          // var dataToUpdate = {
                          //   'camera': camera,
                          //   'token': user.token!,
                          // };
                          var response =
                              await CameraService().addCamera(camera);
                          print('body');
                          print(response['success']);
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
