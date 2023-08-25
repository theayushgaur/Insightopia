import 'package:expense_app/accounts/signin_screen.dart';
import 'package:expense_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class OnBoardButton extends StatelessWidget {
  const OnBoardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInScreen()));
      },
      shape: CircleBorder(),
      elevation: 0.6,
      child: Icon(
        Icons.arrow_forward,
        color: const Color.fromRGBO(12, 53, 106, 1),
      ),
    );
  }
}
