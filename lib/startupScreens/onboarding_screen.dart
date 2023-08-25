import 'package:expense_app/startupScreens/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboard_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 1;
              });
            },
            itemCount: onboardData.length,
            controller: _controller,
            itemBuilder: (context, index) => OnBoardingWidget(
              image: onboardData[index].image,
              title: onboardData[index].title,
              description: onboardData[index].description,
            ),
          ),
          Container(
            alignment: Alignment(0.0, 0.82),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: SlideEffect(
                activeDotColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 65.0, right: 22),
            child: Align(
              alignment: Alignment.bottomRight,
              child: isLastPage ? const OnBoardButton() : null,
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoard {
  late final String image, title, description;
  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> onboardData = [
  OnBoard(
      image: 'assets/images/Online article-cuate (1).png',
      title: 'Welcome to Insightopia',
      description:
          'Stay informed, stay inspired. Get the latest breaking news, in-depth featuresand trending stories at your fingertips.'),
  OnBoard(
      image: 'assets/images/Online article-bro (1).png',
      title: 'Easy Reading, Anytime',
      description:
          'Enjoy news wherever you go. Whether you\'re waiting in line or relaxing at home, our appmakes staying updated a breeze.'),
  // OnBoard(
  //     image: 'assets/images/Online article-pana.png',
  //     title: 'Plan Long Trips with\nConfidence',
  //     description:
  //         'Embark on epic electric adventures with the help of\n EV PlugMap long trip planner'),
];
