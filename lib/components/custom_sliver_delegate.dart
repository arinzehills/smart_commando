
import 'package:flutter/material.dart';
import 'package:smart_commando/constants/constant.dart';

import 'my_curve_container.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
      final double expandedHeight;
      final bool hideTitleWhenExpanded;
      Widget? aligncontainerwidget;//the widget that is align/stacked at the top of the curve container
      bool? showaligncontainerwidget;//the widget that is align/stacked at the top of the curve container
      Widget? widget1;//widget that will be postitoned at the top of the search bar
      Widget? widget2;//widget that will be postitoned at the bottom of the search bar
      Widget? title_widget;// this widget will be at the right site of the app bar
      String title;
      String? searchHint;
      double? curveContainerHeight;
      bool? showHorizontalScrollList;
      bool? showLogo;
      Alignment alignment;
      CustomSliverDelegate({
        required this.expandedHeight,
        this.hideTitleWhenExpanded = true,
        this.showHorizontalScrollList,
        this.aligncontainerwidget,
        this.title_widget,
        this.showaligncontainerwidget,
         required this.title, 
        this.searchHint,
        this.curveContainerHeight,
        this.showLogo,
        required this.alignment, this.widget2,this.widget1
      });

        List<String> imgUrl = [
          "assets/user_blue.png",
          "assets/sciences.png",
          "assets/social.png",
          "assets/arts.png",
  ];

   
      
      @override
      Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) {
        final appBarSize = expandedHeight - shrinkOffset;
        final cardTopPosition = expandedHeight / 2 - shrinkOffset;
        final proportion = 2 - (expandedHeight / appBarSize);
        final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
         Size size= MediaQuery.of(context).size;
        return 
        // SizedBox(
          // height: expandedHeight + expandedHeight / 2,
          // child: 
          Stack(
            children: [
              SizedBox(
                // height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
                child:   MyCurveContainer(
                        size: size,
                        height: curveContainerHeight ?? size.height * 0.34,
                        pagetitle: title,
                        searchHint: searchHint,
                        curvecontainerwidget1: widget1,
                        showLogo:showLogo ?? true,
                        
                        ),
              ),
              
                 if(showHorizontalScrollList==true)
                  Align(
                            alignment: alignment,
                               child: Opacity(
                      opacity: percent,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, left: 30,right: 0, bottom: 0),
                        child:ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: 4,
                                //  shrinkWrap: true,
                                //  padding: EdgeInsets.only(top: 10,bottom: 10),
                                //  physics: NeverScrollableScrollPhysics(),
                                 itemBuilder: (context, index){
                                   return
                                   Padding(
                                padding: const EdgeInsets.only(top: 125.0,left: 10, right: 10, bottom: 110),
                                child:Container(
                                            height: 110,
                                            width: size.width* 0.28,                  
                                              decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 30,
                              spreadRadius: 0,
                              offset: Offset(5,20)
                            )
                          ]
                                              ),  
                                              child:  Center(           
                        child:    Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                            child: Image.asset(
                                              "assets/sciences.png",
                                              height: 70,
                                              )
                                                          ),
                            Text('Sciences',style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        ),
                                    ),
                                    )
                            );
                                 }
                        ),
                      ),
                    ),
                             ),
             showaligncontainerwidget==true ? Align(
               alignment: alignment,
               child: Opacity(
                    opacity: percent,
                    child: Padding(
                      padding: EdgeInsets.only(top: 33.9 * percent, left: 30,right: 30, bottom: 0),
                      child: Container(
                  height: 90,
                  width: size.width* 0.85,                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      gradient: LinearGradient(
                        colors: [Colors.red[900]!,myDarkBrown]
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 30,
                          spreadRadius: 0,
                          offset: Offset(5,20)
                        )
                      ]
                    ),  
                    child:  aligncontainerwidget ?? SizedBox(),
                        ),
                    ),
                  ),
             ): SizedBox(),
                
               
            ],
        );
      }

      @override
      double get maxExtent => expandedHeight + expandedHeight / 2;

      @override
      double get minExtent =>expandedHeight<150 ? expandedHeight-8 : expandedHeight-100;

      @override
      bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
        return true;
      }
    }
