import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/theme_changer.dart';
import '../screens/bbc_news.dart';
import '../screens/discover_page.dart';
import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';

class drawerMenu extends StatelessWidget {
  const drawerMenu({
    super.key,
    required this.themeChanger,
  });

  final ThemeChanger themeChanger;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ayush Gaur',
                      style: GoogleFonts.averiaLibre(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '@theayushgaur',
                      style: GoogleFonts.averiaLibre(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiscoverPage1()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.alt_route,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Discover',
                          style: GoogleFonts.averiaLibre(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BbcNews()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.newspaper,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'BBC',
                          style: GoogleFonts.averiaLibre(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.computer,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'TechCrunch',
                        style: GoogleFonts.averiaLibre(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Theme : ',
                        style: GoogleFonts.averiaLibre(
                          color: Theme.of(context).colorScheme.onTertiary,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RadioListTile<ThemeData>(
                      title: Text(
                        'LightMode',
                        style: GoogleFonts.averiaLibre(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                      value: lightTheme,
                      groupValue: themeChanger.thememode,
                      onChanged: themeChanger.setTheme),
                  RadioListTile<ThemeData>(
                      activeColor: Colors.white,
                      title: Text(
                        'DarkMode',
                        style: GoogleFonts.averiaLibre(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                      value: darkTheme,
                      groupValue: themeChanger.thememode,
                      onChanged: themeChanger.setTheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
