import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_commando/constants/constant.dart';


final double buttonSize=80;
class CircularFabWidget extends StatefulWidget {
   CircularFabWidget({ Key? key }) : super(key: key);

  @override
  State<CircularFabWidget> createState() => _CircularFabWidgetState();
}

class _CircularFabWidgetState extends State<CircularFabWidget> 
 with SingleTickerProviderStateMixin {
   late AnimationController controller;

   @override
   void initState(){
     super.initState();

     controller=AnimationController(
       duration: const Duration(milliseconds: 250),
       vsync: this);
   }
   @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>Flow(
    delegate: FlowMenuDelegate(controller:controller),
    
    children:<IconData> [
      Icons.mail,
      Icons.call ,
      Icons.notifications,
      Icons.sms,
      Icons.menu,
    ].map<Widget>(buildFAB).toList(),
  );

  Widget buildFAB(IconData icon)=>SizedBox(
    height: buttonSize,
    width: buttonSize,
    child: FloatingActionButton(
      elevation: 0,
      backgroundColor: myBrown,
      splashColor:Colors.white,
      child: IconButton(
            onPressed: (){},
             icon: Icon(icon,
              color: Colors.white,
              size: 45,
              ),
      ),
      onPressed: (){
        print('pressed');
        if(controller.status==AnimationStatus.completed){
          controller.reverse();
        }else{
          controller.forward();
        }
      },
    ),
  );
}

class FlowMenuDelegate extends FlowDelegate{
  final Animation<double> controller;

  const FlowMenuDelegate({required this.controller})
        :super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context){
    final size=context.size;
    final xStart=size.width -buttonSize;
    final yStart=size.height -buttonSize;

    final n=context.childCount;
    for(int i=0; i<n;i++){
      final isLastItem=i==context.childCount -1;
      final setValue=(value)=>isLastItem ? 0.0 :value;

      final theta=i * pi * 0.5/(n-2);
      final radius=180 * controller.value;
      final x=xStart - setValue(radius * cos(theta));
      final y=yStart - setValue(radius * sin (theta));

      context.paintChild(
        i,
        transform: Matrix4.identity()
        ..translate(x,y,0)
        ..translate(buttonSize/2,buttonSize/2)
        ..rotateZ(isLastItem ? 0.0 : 180 *(1-controller.value) *pi/180)
        ..scale(isLastItem ? 1.0 : max(controller.value,0.5))
        ..translate(-buttonSize/2,-buttonSize/2),
      );
    }
  }
  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate)=>false;
}

