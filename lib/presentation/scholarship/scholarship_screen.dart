import 'package:flutter/material.dart';

class ScholarShipScreen extends StatelessWidget {
  static const String routeName = '/scholarship';
  const ScholarShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scholarship'),
      ),
    );
  }
}
