import 'package:flutter/material.dart';
import 'package:pollo_education/design_system/themes.dart';
import 'package:pollo_education/splash/splash_screen.dart';

class PolloApp extends StatelessWidget {
  const PolloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Polo Education',
      theme: AppTheme.light,
      home: SplashScreen(),
    );
  }
}
