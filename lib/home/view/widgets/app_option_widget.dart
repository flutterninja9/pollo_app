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
      width: 70.0,
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
        border: const Border.fromBorderSide(
          BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          appOption.label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
