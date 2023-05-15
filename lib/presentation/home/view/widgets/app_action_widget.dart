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
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // darks shades
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.4),
                ],
              ),
            ),
          ),
          Center(
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.play_arrow,
                size: 40,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
