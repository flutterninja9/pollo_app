import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pollo_education/app/polo_app.dart';
import 'package:pollo_education/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();
  await dotenv.load();
  // override shared prefs riverpod
  final sp = await SharedPreferences.getInstance();
  runApp(const PolloApp());
}
