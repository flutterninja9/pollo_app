import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';

class GoalListTile extends StatelessWidget {
  const GoalListTile({
    Key? key,
    required this.title,
    this.imgUrl,
    required this.onTap,
    this.trailingIcon,
    this.fontSize,
  }) : super(key: key);

  final String title;
  final String? imgUrl;
  final VoidCallback onTap;
  final IconData? trailingIcon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getSize(context).width,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
            color: R.color.blueColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            imgUrl == null
                ? const SizedBox()
                : Image.network(imgUrl!, height: 30, width: 30),
            imgUrl == null ? const SizedBox() : const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    color: R.color.surface,
                    fontSize: fontSize ?? 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            trailingIcon == null
                ? SizedBox.shrink()
                : FaIcon(trailingIcon, color: R.color.surface)
          ],
        ),
      ),
    );
  }
}
