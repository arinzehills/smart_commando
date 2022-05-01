

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/profile.dart';

import 'components/normal_curve_container.dart';
import 'components/profile_list.dart';
import 'components/radiantgradient_mask.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({ Key? key }) : super(key: key);

  
  @override
  _EditProfileState createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {

 var userData;

@override
   void initState() {
    super.initState();
    // var index = widget.index;
  }

  
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    // final user= Provider.of<MyUser>(context);
  var currentFocus;
    
 unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

        // if(snapshot.hasData){
          // UserDetail? userData= snapshot.data ;
          // String name=userData['name'] ?? 'no name';
          // String address=userData['address'] ?? 'no address yet';
          // String phone=userData['phone'] ?? 'no phone no added';
          // String email=userData['email'] ?? 'Your email';

              List<UserWidget> title =[
                UserWidget(title:'name' ,leading: Icons.person,titleType: 'name'),
                UserWidget(title:'phone',leading: Icons.mobile_friendly,titleType: 'phone'),
                UserWidget(title:'address',leading: Icons.location_on,titleType: 'address'),
                UserWidget(title:'email',leading: Icons.email_outlined,titleType: 'email'),
                // UserWidget(title: '******',leading: Icons.password),
              ];
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  
                  Builder(
                  builder:(context)=> Column(
                    children: [
                      NormalCurveContainer(
                        size: size,
                        height: size.height * 0.24,
                        pagetitle: 'Edit Profile',
                        imageUrl: 'assets/back_button.png',
                        widget: Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Center(child: Text("userData['name']",
                          style: TextStyle(color: Colors.white, fontSize: 30),),),
                        ),
                        ),
                           Padding(
                             padding: const EdgeInsets.only(top:28.0),
                             child: ListView.separated(
                                itemCount: title.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 16),
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index){
                                  return ProfileList(
                                    name: title[index].title,
                                    titletype:title[index].titleType,
                                    leading: title[index].leading,
                                    suffix:Icons.edit ,
                                  );
                                },
                                 separatorBuilder: (BuildContext context, int index) => 
                                 Container(
                                     height: 2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [ myBrown,myDarkBrown]
                                        )
                                        ),
                              ),
                             ),
                           ),
                            Container(
                                   height: 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [ myBrown,myDarkBrown]
                                      )
                                      ),
                            ),
                    ],
                  ),
                ),
                
                 Positioned(      
                child: Padding(              
                  padding: EdgeInsets.only(top: size.height * 0.18),
                            child: Center(           
                            child:    ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                            child: Image.asset(
                                              "assets/user.png",
                                              height: 90,
                                              color: myDarkBrown,
                                              )
                                                          ),
                        ),
                    ),
             ),
                ]
              ),
            ),
          ),
          );

  }
  Widget userWidget(title,leading,suffix) {
    
      bool textFieldState=false;
    return Container(

        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
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
                      leading,
                      size: 30,
                      color: Colors.white,
                      )
                    ),
                      
                  SizedBox(width: 25,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: textFieldState ==false ?  Text(title, 
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      ) : TextField(
                        autofocus: true,
                      decoration: InputDecoration(
                        hintText: title,
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                      onChanged: (val){
                                  if(mounted) {setState(() =>title=val);}
                                  // print('namies'+ widget.name.toString());
                                     },
                    ),                       
                    ),
                  ),
                     RadiantGradientMask(
                  child: IconButton(
                      icon: Icon(
                       suffix,
                        size: 30,
                        ),
                      color: Colors.white,
                      onPressed: (){

                       setState(() {
                            textFieldState=true;
                          });
                      },
                      )
                    ),
                ],
              ),
            ),
            
          ],
        ),
      );
      }
}