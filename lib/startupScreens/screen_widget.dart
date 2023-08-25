import 'package:expense_app/accounts/signin_screen.dart';
import 'package:expense_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingWidget extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  const OnBoardingWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 53, 106, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignInScreen(),
                        ));
                  },
                  child: Text(
                    'Skip',
                    style: GoogleFonts.averiaLibre(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                widget.image,
                height: 350,
                width: 350,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.white),
                  bottom: BorderSide(width: 1, color: Colors.white),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.averiaLibre(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.averiaLibre(
                  fontSize: 18,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 22.0, top: 53),
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: FloatingActionButton(
            //       backgroundColor: Pallate.mainColor,
            //       onPressed: () {},
            //       shape: CircleBorder(),
            //       elevation: 0.6,
            //       child: Icon(
            //         Icons.arrow_forward,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
