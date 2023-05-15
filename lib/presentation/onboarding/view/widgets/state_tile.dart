import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pollo_education/design_system/r.dart';
import 'package:pollo_education/models/state_model.dart';

class StateTile extends StatelessWidget {
  final StateModel state;
  final bool isSelected;
  const StateTile({
    super.key,
    required this.state,
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
                    'https://polloeducation.tunajifoundation.com/public/storage/upload/${state.image}'),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              state.state,
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
