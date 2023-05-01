import 'package:flutter/material.dart';

class B2CScreen extends StatefulWidget {
  const B2CScreen({super.key});

  @override
  State<B2CScreen> createState() => _B2CScreenState();
}

class _B2CScreenState extends State<B2CScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B2C'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('B2C')],
        ),
      ),
    );
  }
}
