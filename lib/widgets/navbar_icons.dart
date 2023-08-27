import 'package:flutter/material.dart';

class bottomnavicon extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final Color iconColor;

  const bottomnavicon({
    super.key,
    this.onTap,
    this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 35,
        width: 90,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
