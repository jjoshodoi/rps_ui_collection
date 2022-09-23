import 'package:flutter/material.dart';
import 'package:rps_ui_e1/screens/DetailPageJosh.dart';
// import 'package:rps_ui_e1/screens/LandingPage.dart';
import 'package:rps_ui_e1/utils/constants.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design 1',
      theme: ThemeData(
          // all onPrimary, on... are a color that can be seen on top of the focus (Primary, black - onPrimary, white)
          primaryColor: COLOR_WHITE,
          colorScheme: ColorScheme(
            primary: COLOR_WHITE,
            onPrimary: Colors.black,
            background:
                COLOR_WHITE, // typically appears behind scrollable content.
            onBackground: Colors.black,
            secondary: COLOR_DARK_BLUE,
            onSecondary: Colors.white,
            tertiary: COLOR_GREEN,
            onTertiary: Colors.white,
            error: Colors
                .black, // to use for input validation errors, e.g. for InputDecoration.errorText.
            errorContainer: Colors
                .grey, // used for error elements needing less emphasis than error.
            onError: Colors.white, // clearly legible when drawn on error.
            onErrorContainer: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
            brightness: Brightness
                .light, // The overall brightness of this color scheme.
            // inverseSurface [with onInverseSurface] - A surface color used for displaying the reverse of what’s seen in the surrounding UI, for example in a SnackBar to bring attention to an alert.
            // inversePrimary - An accent color used for displaying a highlight color on inverseSurface backgrounds, like button text in a SnackBar
            // primaryContainer [with onPrimaryContainer]- elements needing less emphasis than primary.
          ),
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat"),
      home: DetailPageJosh(),
    );
  }
}
