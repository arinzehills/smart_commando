import 'package:flutter/material.dart'
;
import 'package:smart_commando/auth/registration/address_page.dart';
import 'package:smart_commando/auth/registration/main_reg.dart';
import 'package:smart_commando/auth/registration/name_page.dart';
import 'package:smart_commando/auth/registration/pin_page.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class RegIndicator extends StatefulWidget {
   RegIndicator({ Key? key }) : super(key: key);

  @override
  _RegIndicatorState createState() => _RegIndicatorState();
}

class _RegIndicatorState extends State<RegIndicator> {
  final _controller=PageController();
   
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
               Positioned(
                top: -118,
                left: -116,
                child: Image.asset(
                  'assets/downcurve.png',
                  width:size.height * 0.805,
                  height:370,
                  ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pageView
                   SizedBox(
                      height: size.height *0.741,
                      child: PageView(
                        controller: _controller,
                        children: [
                          NamePage(controller: _controller
                            ,),
                          AddressPage(
                            controller: _controller
                          ),
                          MainReg(controller: _controller),
                          PinPage(controller: _controller),
                        ],
                      ),
                  ),
                  
                  //dot indicators
                  Padding(
                    padding: const EdgeInsets.only(bottom:118.0),
                    child: SmoothPageIndicator(
                      controller: _controller, 
                      count: 4,
                      effect: JumpingDotEffect(
                        activeDotColor: myBrown,
                        dotColor: Colors.red.shade100,
                        dotHeight: 25,
                        dotWidth: 25,
                        verticalOffset: 10
                      ),
                      ),
                  )
                ],
              ),
              Positioned(
                bottom: -188,
                right: -146,
                child: Image.asset(
                  'assets/upcurve.png',
                  width:size.height * 0.905,
                  height:380,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}