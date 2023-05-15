import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pollo_education/design_system/r.dart';
import 'package:pollo_education/models/board_model.dart';

class BoardTile extends StatelessWidget {
  final BoardModel board;
  final bool isSelected;
  const BoardTile({
    super.key,
    required this.board,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: R.color.blueColor,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: R.color.surface,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    'https://polloeducation.tunajifoundation.com/public/storage/upload/${board.image}'),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              board.name,
              style: TextStyle(color: R.color.surface),
            ),
          ),
          const SizedBox(width: 8),
          isSelected
              ? FaIcon(FontAwesomeIcons.check, color: R.color.surface)
              : const SizedBox(),
        ],
      ),
    );
  }
}
