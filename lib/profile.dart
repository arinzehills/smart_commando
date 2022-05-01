import 'package:flutter/material.dart';
import 'package:smart_commando/constants/constant.dart';
import 'components/mymenu.dart';
import 'components/myoval_gradient_button.dart';
import 'components/normal_curve_container.dart';
import 'components/profile_list.dart';
import 'constants/my_navigate.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  
  @override
  _ProfileState createState() => _ProfileState();
}
class UserWidget{
  String title;
  String? titleType;
  IconData? leading;
  UserWidget({required this.title, this.titleType,
             this.leading});

}
class _ProfileState extends State<Profile> {
  var userData;
  var userToken;
    bool loading=false;


@override
   void initState() {
    super.initState();
    // var index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
//     final user= Provider.of<MyUser>(context);
// final AuthService _auth=AuthService();

             List<UserWidget> title =[
            UserWidget(title:'Your name',leading: Icons.person),
            UserWidget(title:  'no phone no added',leading: Icons.mobile_friendly),
            UserWidget(title: 'Your email',leading: Icons.email_outlined),
            UserWidget(title: 'no address',leading: Icons.location_on),
          ];
        return Scaffold(
        floatingActionButton: MyMenu(),
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
                        pagetitle: 'Profile',
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
                                  //  DocumentSnapshot  document=snapshot.data as DocumentSnapshot<Object?>;
                                  //    dynamic orderData=document.data();
                                  return 
                                  // Container();
                                  ProfileList(
                                    name: title[index].title,
                                    leading: title[index].leading,
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
                            SizedBox(height: 20,),
                            MyOvalGradientButton(
                              placeHolder: 'Logout', pressed: () async { 
                                   
                              }, 
                              firstcolor: myBrown, secondcolor: myDarkBrown)
                    ],
                  ),
                ),
                
                 Positioned(
                    
                child: Padding(              
                  padding: EdgeInsets.only(top:  size.height * 0.18),
                            child: Center(           
                            child:    ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                            child: Image.asset(
                                              "assets/user.png",
                                              height: 90,
                                              color:myBrown,
                                              
                                              )
                                                          ),
                        ),
                  )
                 ),
                 Positioned(
                    
                child: Padding(              
                  padding: EdgeInsets.only(
                    top:size.height*0.8),
                  child: Center(           
                  child: MyOvalGradientButton(
                    placeHolder: 'Edit profile', 
                    pressed: (){
                      MyNavigate.navigatejustpush(
                        EditProfile(),
                         context);
                    }, 
                    firstcolor: myDarkBrown,
                     secondcolor: myBrown,
                     child: 
                                               Padding(
                                                 padding: const EdgeInsets.only(left:18.0),
                                                 child: ImageIcon(
                                                  AssetImage('assets/edit_user.png'),
                                                    size: 30,
                                                    color: Colors.white,
                                                  ),
                                               ),
                     )
              ),
                )
                 )
                ]
              ),
            ),
          ),
          );

  }
  
}