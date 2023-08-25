import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
        // borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Image.asset(
        imagePath,
        height: 35,
      ),
    );
  }
}
