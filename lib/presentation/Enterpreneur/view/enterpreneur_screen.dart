import 'package:flutter/material.dart';

class EnterpreneurScreen extends StatefulWidget {
  const EnterpreneurScreen({super.key});
  static const routeName = '/enterpreneur';
  @override
  State<EnterpreneurScreen> createState() => _EnterpreneurScreenState();
}

class _EnterpreneurScreenState extends State<EnterpreneurScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enterpreneur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Enterpreneur')],
        ),
      ),
    );
  }
}
