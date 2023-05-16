import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/utils/design_system/themes.dart';

class PolloApp extends StatelessWidget {
  const PolloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Polo Education',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: di<GoRouter>(),
    );
  }
}
