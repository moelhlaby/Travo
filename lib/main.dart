import 'package:flutter/material.dart';
import 'package:travo/constants.dart';
import 'package:travo/pages/authentication.dart';
import 'package:travo/pages/home_views/pofile.dart';
import 'package:travo/pages/onboarding_screen.dart';
import 'package:travo/pages/onboarding_screens/profile_view.dart';
import 'pages/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.grey,
        unselectedWidgetColor: Colors.white,
        primaryColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'SFProText',
          ),

        ) ,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
          )
        )
      ),
      home:ProfilePage() ,
    );
  }
}

