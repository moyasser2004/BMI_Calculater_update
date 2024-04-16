import 'package:flutter/material.dart';
import '../const/app_const.dart';

abstract class AppDecorations {
  static Decoration mainAppDecoration = BoxDecoration(
    color: const Color(0xff333333),
    borderRadius: BorderRadius.circular(16),
    gradient: gradient,
    boxShadow: const [
      BoxShadow(
        color: Color(0xff171717),
        offset: Offset(3.0, 6.0),
        blurRadius: .9,
        spreadRadius: 0.0,
      ),
      BoxShadow(
        color: Color(0xff4f4f4f),
        offset: Offset(-3.0, -3.0),
        blurRadius: .9,
        spreadRadius: 0.0,
      ),
    ],
  );
  static Decoration innerCircleAppDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0xff333333),
    gradient: gradient,
    boxShadow: const [
      BoxShadow(
        color: Colors.white12,
        offset: Offset(-3.0, -3.0),
        blurRadius: 10,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Colors.white12,
        offset: Offset(3.0, 3.0),
        blurRadius: 10,
        spreadRadius: 1,
      ),
    ],
  );
  static Decoration centerContainerAppDecoration = BoxDecoration(
    color: const Color(0xff333333),
    borderRadius: BorderRadius.circular(20),
    gradient: gradient,
    boxShadow: const [
      BoxShadow(
        color: Color(0xff171717),
        offset: Offset(1, 5.0),
        blurRadius: 3,
        spreadRadius: 2,
      ),
    ],
  );
  static Decoration calculateAppDecoration = BoxDecoration(
    color: const Color(0xFF1E1E1E),
    borderRadius: BorderRadius.circular(20),
    gradient: gradient,
    boxShadow: const [
      BoxShadow(
        color: Color(0xff171717),
        offset: Offset(3.0, 6.0),
        blurRadius: .9,
        spreadRadius: 0.0,
      ),
      BoxShadow(
        color: Color(0xff444444),
        offset: Offset(-2.0, -3.0),
        blurRadius: .9,
        spreadRadius: 0.0,
      ),
    ],
  );
}
