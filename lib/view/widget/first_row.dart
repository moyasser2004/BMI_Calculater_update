import 'package:bmi_end/view/widget/text_animation.dart';
import 'package:flutter/material.dart';

import '../../core/class/app_images.dart';
import 'expanded_container.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({super.key, required this.weightNumber});

  final double weightNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  TopExpandedContainer(
                      flex: 1,
                      child: Center(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Transform.rotate(
                                angle: 3.16,
                                child: const FittedBox(
                                    child: Icon(Icons
                                        .double_arrow_outlined)))),
                      )),
                  SizedBox(height: 7),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            TopExpandedContainer(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$weightNumber',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const TextAnimation(
                    text: 'BSA',
                  ),
                  Image.asset(
                    AppImages.electricImage,
                    height: 60,
                    fit: BoxFit.fill,
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
