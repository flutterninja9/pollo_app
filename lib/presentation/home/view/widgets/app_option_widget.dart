import 'package:flutter/material.dart';
import 'package:pollo_education/presentation/home/view/home_screen.dart';
import 'package:pollo_education/utils/design_system/r.dart';

class AppOptionWidget extends StatelessWidget {
  const AppOptionWidget({
    super.key,
    required this.option,
    required this.onTap,
  });

  final AppOptionContainer option;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: R.color.greenColor.withOpacity(0.09),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: R.color.greenColor.withOpacity(0.2),
              radius: 30,
              foregroundColor: R.color.blueColor,
              child: option.icon,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    option.label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: R.color.blueColor,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
