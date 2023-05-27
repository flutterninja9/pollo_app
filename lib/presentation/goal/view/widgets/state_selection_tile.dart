import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pollo_education/utils/design_system/r.dart';

class StateSelectionTile extends StatelessWidget {
  const StateSelectionTile({
    Key? key,
    required this.title,
    required this.expandedWidget,
    this.imgUrl,
  }) : super(key: key);

  final String title;
  final Widget expandedWidget;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
          child: Row(
            children: [
              imgUrl == null
                  ? SizedBox()
                  : Image.network(imgUrl!, height: 30, width: 30),
              Text(
                title,
                style: TextStyle(
                    color: R.color.surface,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        expanded: expandedWidget,
        collapsed: const SizedBox(),
      ),
    );
  }
}
