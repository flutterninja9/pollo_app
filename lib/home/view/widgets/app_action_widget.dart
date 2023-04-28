import 'package:flutter/material.dart';
import 'package:pollo_education/home/view/widgets/app_action.dart';

class AppActionWidget extends StatelessWidget {
  const AppActionWidget({
    super.key,
    required this.appAction,
  });

  final AppAction appAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: const Border.fromBorderSide(
          BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 40,
        ),
      ),
    );
  }
}
