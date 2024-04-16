import 'package:bmi_end/core/class/shared_prefrences.dart';
import 'package:bmi_end/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bmi Calculator',
      theme: ThemeManager.darkTheme,
      home: const SecondPage(),
    );
  }
}
