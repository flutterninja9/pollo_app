import 'package:flutter/material.dart';
import 'package:pollo_education/home/view/widgets/app_action.dart';

class AppActionWidget extends StatelessWidget {
  const AppActionWidget({
    super.key,
    required this.appAction,
    required this.onTap,
    required this.coverImage,
  });

  final AppAction appAction;
  final VoidCallback onTap;
  final String coverImage;

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
            width: 2,
          ),
        ),
        image: DecorationImage(
            image: NetworkImage(
              coverImage,
            ),
            fit: BoxFit.cover),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.play_arrow,
          size: 40,
          color: Color.fromRGBO(5, 31, 49, 1),
        ),
      ),
    );
  }
}
