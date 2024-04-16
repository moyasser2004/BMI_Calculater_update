import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bmi_end/view/screen/calculate_screen.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 1400), () {
      setState(() {
        _c = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 3500), () {
      setState(() {
        _d = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 3470), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const CalculateScreen(),
        ));
    }
    );
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / 2
                      : 15,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? h
                  : _c
                      ? 70
                      : 20,
              width: _d
                  ? w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: _b ? Colors.white : Colors.transparent,
                  // shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: _e
                      ? AnimatedTextKit(
                          totalRepeatCount: 1,
                          animatedTexts: [
                            FadeAnimatedText(
                              'Bmi Calculator',
                              duration: const Duration(milliseconds: 1700),
                              textStyle: const TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
