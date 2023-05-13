import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/app/polo_app.dart';
import 'package:pollo_education/utils/core_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  // override shared prefs riverpod
  final sp = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        spProvider.overrideWithValue(sp),
      ],
      child: const PoloApp(),
    ),
  );
}
