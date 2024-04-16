import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onPressed,
    required this.width,
  });

  final double width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        margin: const EdgeInsets.only(bottom: 5),
        width: width,
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              backgroundColor: Colors.red[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "CALCULATE",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Container(
                padding: const EdgeInsets.all(3),
                height: 2.5,
                width: width / 3.3,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
        ));
  }
}
