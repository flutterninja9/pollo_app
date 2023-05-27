import 'package:flutter/material.dart';

class B2BScreen extends StatefulWidget {
  const B2BScreen({super.key});
  static const routeName = '/b2b';
  @override
  State<B2BScreen> createState() => _B2BScreenState();
}

class _B2BScreenState extends State<B2BScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B2B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('B2B')],
        ),
      ),
    );
  }
}
