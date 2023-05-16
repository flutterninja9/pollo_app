import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pollo_education/app/polo_app.dart';
import 'package:pollo_education/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();
  await dotenv.load();
  runApp(const PolloApp());
}
