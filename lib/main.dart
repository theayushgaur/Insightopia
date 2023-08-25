import 'package:expense_app/provider/favourite_item.dart';
import 'package:expense_app/provider/theme_changer.dart';
import 'package:expense_app/screens/home_screen.dart';
import 'package:expense_app/screens/main_screen.dart';
import 'package:expense_app/screens/splash_screen.dart';
import 'package:expense_app/startupScreens/onboarding_screen.dart';
import 'package:expense_app/themes/dark_theme.dart';
import 'package:expense_app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => FavouriteItem()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Insightopia',
            debugShowCheckedModeBanner: false,
            theme: themeChanger.thememode,
            home: const OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
