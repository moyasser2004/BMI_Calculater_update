import 'package:flutter/material.dart';

import '../../core/const/app_const.dart';


class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key, required this.text});

  final String text;

  @override
  State<TextAnimation> createState() => _TextAnimationState(text);
}

class _TextAnimationState extends State<TextAnimation> {
  _TextAnimationState(this.text);

  final String text;
  bool opacity=false;

  void start() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = !opacity;
      });
    });
  }

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontFamily: appFontFamily),
      ),
    );
  }
}
