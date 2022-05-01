
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_commando/components/radiantgradient_mask.dart';



class ProfileList extends StatefulWidget{
  String? name;
  String? titletype;

  IconData? leading;
  IconData? suffix;
  ProfileList({@required this.name,@required this.leading,
  this.suffix,this.titletype});
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {

  bool textFieldState=false;

  @override
  Widget build(BuildContext context) {
    var currentFocus;
    
 unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
    return GestureDetector(
     onTap: unfocus,
      child: Container(
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
                      widget.leading,
                      size: 30,
                      color: Colors.white,
                      )
                    ),
                      
                  SizedBox(width: 25,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: textFieldState ==false ?  Text(widget.name!, 
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      ) : TextField(
                        // autofocus: true,
                      decoration: InputDecoration(
                        hintText: widget.name!,
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                      onChanged: (val){
                                  // if(mounted) {setState(() =>widget.name=val);}
                                  // print('namies'+ widget.name.toString());
                                     },
                    ),                       
                    ),
                  ),
                     RadiantGradientMask(
                  child: IconButton(
                      icon: Icon(
                        widget.titletype=='email'? null: widget.suffix,
                        size: 30,
                        ),
                      color: Colors.white,
                      onPressed: (){
                                //   showDialog(context: context,
                                // builder: (BuildContext context){
                                  
                                //     return BottomModal(titletype:widget.titletype!,
                                //           title: widget.name!,);
                                //   });
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
      ),
    );
  }
}
class SwitchChanged extends Notification {
  final bool val;
  SwitchChanged(this.val);
}