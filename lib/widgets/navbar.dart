import 'package:expense_app/screens/favourite_screen.dart';
import 'package:expense_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navbar_icons.dart';

class bottom_nav_bar extends StatelessWidget {
  const bottom_nav_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        color: Theme.of(context).colorScheme.tertiary,
        // const Color.fromRGBO(241, 240, 232, 1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomnavicon(
                  onTap: () {
                    Get.to(() => Home());
                  },
                  icon: Icons.home,
                ),
                // bottomnavicon(
                //   onTap: () {
                //     Get.to(() => Home());
                //   },
                //   icon: Icons.list_alt,
                //   // title: 'Home',
                // ),
                bottomnavicon(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavScreen()));
                  },
                  icon: Icons.favorite,
                  // title: 'Home',
                ),
                bottomnavicon(
                  onTap: () {
                    Get.to(() => Home());
                  },
                  icon: Icons.person,
                  // title: 'Home',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
