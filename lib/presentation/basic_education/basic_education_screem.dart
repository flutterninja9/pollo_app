import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/utils/design_system/r.dart';

class BasicEduactionScreen extends StatelessWidget {
  static const routeName = "/basic-education";
  const BasicEduactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicEducationScreenView();
  }
}

class BasicEducationScreenView extends StatelessWidget {
  const BasicEducationScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 0.8, color: R.color.blueColor.withOpacity(0.3))),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      di<GoRouter>().pop();
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      size: 16,
                    )),
              ),
              Text(
                'Basic Education',
                style: TextStyle(
                    fontSize: 18,
                    color: R.color.blueColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Expanded(
              child: Container(
            color: R.color.greenColor,
          ))
        ],
      )),
    );
  }
}
