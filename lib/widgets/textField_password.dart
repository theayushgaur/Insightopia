import 'package:flutter/material.dart';

class MyTextFieldPassword extends StatefulWidget {
  final bool obscureText;
  const MyTextFieldPassword({
    super.key,
    required this.obscureText,
  });

  @override
  State<MyTextFieldPassword> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextFieldPassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
        child: TextField(
          style: TextStyle(
            fontSize: 17,
          ),
          obscureText: _obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
