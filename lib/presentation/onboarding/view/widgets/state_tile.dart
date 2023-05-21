import 'package:flutter/material.dart';
import 'package:pollo_education/utils/design_system/r.dart';
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
          Container(
            height: 20,
            width: 20,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: R.color.blueColor,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: R.color.surface)),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: isSelected ? R.color.greenColor : R.color.blueColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
