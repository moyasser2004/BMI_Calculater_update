import 'package:flutter/material.dart';


class PageSizeTransition extends PageRouteBuilder{
  final dynamic page;
  PageSizeTransition(this.page):super(
      pageBuilder: (context,animation,animationTwo){
        return page;
      },
      transitionsBuilder: (context,animation1,animationTwo,child){
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizeTransition(
            sizeFactor: animation1,
            axisAlignment: 0,
            axis: Axis.vertical,
            child: child,
          ),
        );
      }
  );
}