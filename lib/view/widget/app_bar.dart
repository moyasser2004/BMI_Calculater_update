import 'package:bmi_end/core/style/app_text_scale.dart';
import 'package:flutter/material.dart';



class CalculateScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalculateScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox.shrink(),
      backgroundColor: const Color(0xff2c2b2b),
      title: Text(
        "BMI CALCULATOR",
        style: TextStyle(fontSize: AppTextScales.textScaleFactor(context)*24),
      ),
      centerTitle: true,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(26);
}
