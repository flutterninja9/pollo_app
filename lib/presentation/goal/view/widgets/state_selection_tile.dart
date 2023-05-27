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
    this.onTap,
  }) : super(key: key);

  final String title;
  final Widget expandedWidget;
  final String? imgUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                    ? const SizedBox()
                    : Image.network(imgUrl!, height: 30, width: 30),
                imgUrl == null ? const SizedBox() : const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                      color: R.color.surface,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          expanded: expandedWidget,
          collapsed: const SizedBox(),
        ),
      ),
    );
  }
}
