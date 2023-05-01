import 'package:flutter/material.dart';
import 'package:pollo_education/home/view/widgets/app_option.dart';

class AppOptionWidget extends StatelessWidget {
  const AppOptionWidget({
    super.key,
    required this.appOption,
  });

  final AppOption appOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(5, 31, 49, 1),
        borderRadius: BorderRadius.circular(12),
        // border: const Border.fromBorderSide(
        //   BorderSide(
        //     color: Colors.grey,
        //     width: 1,
        //   ),
        // ),
      ),
      child: Center(
        child: Text(
          appOption.label,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
