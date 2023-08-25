import 'package:expense_app/screens/discover_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavBar2 extends StatelessWidget {
  const bottomNavBar2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            onTabChange: (value) {},
            haptic: true,
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.grey,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade700,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textColor: Colors.white,
              ),
              GButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DiscoverPage1()));
                },
                icon: Icons.list_alt,
                text: 'Discover',
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favourite',
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
