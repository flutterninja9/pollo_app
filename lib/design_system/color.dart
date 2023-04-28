import 'package:flutter/widgets.dart';

class PColor {
  PColor._();

  static final _instance = PColor._();
  static PColor get instance => _instance;

  Color primary = const Color.fromRGBO(177, 163, 255, 1);
  Color onPrimary = const Color.fromRGBO(255, 255, 255, 1);
  Color secondary = const Color.fromRGBO(255, 180, 180, 1);
  Color onSecondary = const Color.fromRGBO(255, 255, 255, 1);
  Color error = const Color.fromRGBO(255, 0, 0, 1);
  Color onError = const Color.fromRGBO(255, 255, 255, 1);
  Color background = const Color.fromRGBO(255, 255, 255, 1);
  Color onBackground = const Color.fromRGBO(0, 0, 0, 1);
  Color surface = const Color.fromRGBO(255, 255, 255, 1);
  Color onSurface = const Color.fromRGBO(0, 0, 0, 1);
  Color shadow = const Color.fromRGBO(0, 0, 0, 0.25);
}
