
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_commando/constants/constant.dart';
import 'components/custom_sliver_delegate.dart';
import 'components/gradient_text.dart';
import 'components/mylist_container.dart';
import 'components/mymenu.dart';
class ActionsPage extends StatefulWidget {
  final int user_id;

  const ActionsPage({ Key? key,required this.user_id, }) : super(key: key);

  @override
  _ActionsPageState createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  String uploadType='Files';
    int show=1;
  var userData;
  var userToken;
  var userid;


@override
   void initState() {
    super.initState();
    
    
    // var index = widget.index;
  }
   
    @override
  void dispose() {
    
    // ActionsPageService.ActionsPageInstance;

    // super.dispose();
  }


  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    int empty=0;
            return  Scaffold(
                   floatingActionButton: MyMenu(),
                  // drawer: MyDrawer(),
                  body: SafeArea(
                      child: Stack(
                        children: [
                          CustomScrollView(
                            slivers: <Widget>[
                              SliverPersistentHeader(
                                  pinned: true,
                                  floating: true,
                                  delegate: CustomSliverDelegate(
                                    expandedHeight: 149,
                                    showLogo: false,
                                    aligncontainerwidget: MyListContainer(
                                      title: 'Total ActionsPages',
                                      // sub_title: snapshot.data!.size.toString(),
                                      sub_title: '3',
                                      subtitleColor: Colors.white,
                                      ),
                                    showaligncontainerwidget:true,
                                    title: 'ActionsPages history',
                                    alignment: Alignment(0.0, 1.40),
                                    curveContainerHeight: size.height * 0.33,
                                     widget1: Padding(
                                    padding: const EdgeInsets.only(left:33.0, top: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:18.0),
                                     child:GradientText( "Hi Chris",
                                      style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      ),
                                      gradient:LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.white,Colors.grey],
                                      )),
                                   ),
                                    ],
                                  ),
                                ),
                                  ),
                                ),
                              SliverToBoxAdapter(
                                child: Center(
                                      child:  empty==1 ? Padding(
                                                  padding:  EdgeInsets.only(top: size.height * 0.140),
                                                  child: Container(
                                                    height: size.height * 0.31,
                                                 width: size.width*0.7,
                                                decoration: BoxDecoration(
                                                  
                                                borderRadius: BorderRadius.all(Radius.circular(100)),                
                                                boxShadow: [
                                                              BoxShadow(
                                                                color: myLightBrown.withOpacity(0.24),
                                                                spreadRadius: 15,
                                                                blurRadius: 50,
                                                                offset: Offset(0, 9), // changes position of shadow
                                                              ),
                                                            ],
                                                gradient: LinearGradient(
                                                        begin: Alignment.topLeft,
                                                        end: Alignment.bottomRight,
                                                        colors: [ Colors.white,Colors.white]
                                                      )
                                                ),
                                                child:  Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      ClipRRect(
                                                                    borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                                                    child: Image.asset(
                                                                      "assets/smart_commando.png",
                                                                      height: 160,
                                                                      )
                                                              ),
                                                              Text(' No ActionsPages yet', )
                                                                              
                                                    ],
                                                  ) 
                                        ),
                                      ):
                                   Wrap(
                                     children: [
                                      
                                      Container(
                                        height: 50,
                                      ),

                                      
                                      
                                       ListView.builder(
                                             itemCount: 6,
                                             shrinkWrap: true,
                                             padding: EdgeInsets.only(top: 10,bottom: 10),
                                             physics: NeverScrollableScrollPhysics(),
                                             itemBuilder: (context, index){
                                               return Padding(
                                            padding: const EdgeInsets.only(top: 10.0,left: 30, right: 30),
                                            child: 
                                         GestureDetector(
                                          onTap: (){
                                            // MyNavigate.navigatejustpush(UploadListPage(isUser:false,), context);
                                          },
                                          child: Container(
                                                          height: 90,
                                                          width: size.width* 0.85,                  
                                                            decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 30,
                                              spreadRadius: 0,
                                              offset: Offset(10,30)
                                            )
                                          ]
                                                            ),  
                                                              child: MyListContainer(
                                                                title: 'hig',
                                                                //title: 'Buy Units:34 ',
                                                              titleColor: Colors.black,
                                                              sub_title: 'ghvjbj',
                                                              )
                                                          ),
                                        ),                      
                                          );
                                             }
                                             ),
                                     ],
                                   ),
                                ),
                              ),
                            ],
                          ),
                      
                          ]
                      ),
                    ),
                  
                  );
                  
         

  }
   Widget SwithButton(name)=> Padding(
                    padding: const EdgeInsets.only( left:34.0, top:40 ),
                    child: Row(                      
                       mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(                        
                        gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: myBrownGradient
                                         ),                                      
                        borderRadius: BorderRadius.all(Radius.circular(100)), 
                         boxShadow: [
                                                          BoxShadow(
                                                            color: myBrown.withOpacity(0.24),
                                                            // spreadRadius: 5,
                                                            blurRadius: 10,
                                                            offset: Offset(0, 5), // changes position of shadow
                                                          ),
                                                        ],
                     ),
                     child: Center(
                         child: Text(
                           name,
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 15
                           ),
                         )
                     ),
                  
               ),
     ],
   ),
 );
}