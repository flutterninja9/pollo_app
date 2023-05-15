import 'package:flutter/material.dart';
import 'package:pollo_education/utils/design_system/themes.dart';
import 'package:pollo_education/presentation/splash/splash_screen.dart';

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
