import 'package:flutter/material.dart';
import 'package:pollo_education/home/view/widgets/app_action.dart';
import 'package:pollo_education/home/view/widgets/app_action_widget.dart';

class AppActionsWidget extends StatelessWidget {
  const AppActionsWidget({
    super.key,
    required this.action,
  });

  final AppActions action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.0,
      child: Column(
        children: [
          Row(
            children: [
              Text(action.label),
              const Spacer(),
              TextButton(
                onPressed: action.onTapSeeAll,
                child: const Text('See All'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: action.appActions.length,
              itemBuilder: (context, index) {
                final appAction = action.appActions[index];

                return AppActionWidget(appAction: appAction);
              },
            ),
          ),
        ],
      ),
    );
  }
}
