import 'package:flutter/material.dart';

class bottomnavicon extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;

  const bottomnavicon({
    super.key,
    this.onTap,
    this.icon,
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
          color: Colors.white,
        ),
      ),
    );
  }
}
