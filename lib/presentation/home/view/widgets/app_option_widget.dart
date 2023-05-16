import 'package:flutter/material.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/utils/design_system/r.dart';

class AppOptionWidget extends StatelessWidget {
  const AppOptionWidget({
    super.key,
    required this.classData,
    required this.onTap,
  });

  final ClassModel classData;
  final Function(ClassModel) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(classData),
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: R.color.blueColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            classData.classNAme,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
