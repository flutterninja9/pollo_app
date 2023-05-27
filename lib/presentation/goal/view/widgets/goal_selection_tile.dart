import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pollo_education/utils/design_system/r.dart';

class GoalSelectionTile extends StatelessWidget {
  const GoalSelectionTile({
    Key? key,
    required this.title,
    required this.expandedWidget,
  }) : super(key: key);

  final String title;
  final Widget expandedWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: R.color.blueColor, borderRadius: BorderRadius.circular(8)),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
            iconPadding: const EdgeInsets.all(16),
            tapHeaderToExpand: true,
            iconColor: R.color.surface,
            hasIcon: true,
            expandIcon: FontAwesomeIcons.plus,
            collapseIcon: FontAwesomeIcons.minus),
        header: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: TextStyle(
                color: R.color.surface,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        expanded: expandedWidget,
        collapsed: const SizedBox(),
      ),
    );
  }
}
