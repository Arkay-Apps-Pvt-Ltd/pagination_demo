import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';
import '../constants/Constants.dart';

ThemeData themeData(bool isDarkTheme, BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: isDarkTheme ? Colors.black : Colors.white,
    backgroundColor: isDarkTheme ? Colors.grey : Color(0xffF1F5FB),
    indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
    // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
    hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
    highlightColor:
        isDarkTheme ? Color(0xff372901) : primaryColor.withOpacity(0.4),
    hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
    focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
    disabledColor: Colors.grey,
    cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
    canvasColor: isDarkTheme ? Colors.black87 : Colors.grey[100],
    brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    dividerColor: isDarkTheme ? Colors.white54 : Colors.black12,
    textTheme: TextTheme(
      bodyText1: themeTextStyle(isDarkTheme),
      bodyText2: themeTextStyle(isDarkTheme),
      subtitle1: themeTextStyle(isDarkTheme),
      subtitle2: themeTextStyle(isDarkTheme),
      headline6: themeTextStyle(isDarkTheme),
      headline5: themeTextStyle(isDarkTheme),
      caption: captionTextStyle(isDarkTheme),
    ),
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light(),
        ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: isDarkTheme ? Colors.blue[900] : primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: Colors.white),
      // toolbarTextStyle: ,
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),

    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: isDarkTheme ? Colors.white : primaryColor,
      cursorColor: isDarkTheme ? Colors.white : primaryColor,
      selectionColor: isDarkTheme ? Colors.white60 : Colors.black12,
    ),
  );
}

TextStyle themeTextStyle(bool isDarkTheme) {
  return TextStyle(
    color: isDarkTheme
        ? Colors.white.withOpacity(0.8)
        : Colors.black.withOpacity(0.8),
    fontFamily: poppinsFont,
  );
}

TextStyle captionTextStyle(bool isDarkTheme) {
  return TextStyle(
    color: isDarkTheme ? Colors.white.withOpacity(0.8) : Colors.grey,
    fontFamily: poppinsFont,
  );
}
