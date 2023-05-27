import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._();

  static final String env = dotenv.env['ENV']!;
  static final String fileUrl = dotenv.env['FILE_URL']!;
}
