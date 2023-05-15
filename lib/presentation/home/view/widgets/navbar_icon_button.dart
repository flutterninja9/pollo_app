import 'package:flutter/material.dart';

class NavbarIconButton extends StatelessWidget {
  const NavbarIconButton(
      {super.key,
      required this.iconPath,
      required this.onTap,
      required this.isSelected,
      required this.iconLabel});

  final String iconPath;
  final VoidCallback onTap;
  final String iconLabel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Column(
          children: [
            Image.asset(
              iconPath,
              height: 30,
              width: 30,
              fit: BoxFit.cover,
              color: isSelected ? Colors.green : Colors.black,
            ),
            Text(
              iconLabel,
              style: TextStyle(fontSize: 10),
            )
          ],
        ));
  }
}
