import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  ///border radius default
  static const double borderRadius = 6;
  static const double buttonBorderRadius = 8;
  static const double borderWidth = 2;
  static const double widgetHeight = 42;
  static const double margin = 8;

  static const String errorString = "Error !";

  ///colors
  static const Color _white = Colors.white;
  static const Color _black = Colors.black;
  static const Color iconColor = Color(0xff8795A5);
  static const Color activateColor = CupertinoColors.activeGreen;
  static const Color deActivateColor = CupertinoColors.destructiveRed;

  ///Dark theme colors
  static const Color _appBar = Color(0xff222222);
  static const Color _background = Color(0xff181818);
  static const Color _scaffoldBackground = Color(0xff121212);
  static const Color _lightGrey = Color(0xff9E9EA3);
  static const Color _darkGrey = Color(0xff35383C);

  ///returns the standard box decoration
  static BoxDecoration getBoxDecoration(context,
          {final bool isError = false}) =>
      BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
          border: isError
              ? Border.all(color: Theme.of(context).errorColor, width: 1.3)
              : Border.all(
                  color: Theme.of(context).unselectedWidgetColor, width: 1.3));

  ///styles
  static const TextStyle heading1 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 21, color: _black);
  static const TextStyle heading2 =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: _black);
  static const TextStyle heading3 =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: _black);
  static const TextStyle body1 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 17, color: _black);
  static const TextStyle body2 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: _black);

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 14,
    color: activateColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle subtitle2 =
      TextStyle(color: CupertinoColors.tertiaryLabel, fontSize: 14);
  static const TextStyle button =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 22, color: _white);

  /// Light Theme

  static final ThemeData lightTheme = ThemeData(
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        primaryContrastingColor: CupertinoColors.activeBlue,
        scaffoldBackgroundColor: _scaffoldBackground,
      ),
      fontFamily: 'SanFrancisco',
      errorColor: deActivateColor,
      backgroundColor: _white,
      splashColor: Colors.blueAccent,
      appBarTheme: AppBarTheme(
          color: _white,
          iconTheme: IconThemeData(color: CupertinoColors.activeBlue)),
      primaryColor: CupertinoColors.activeBlue,
      scaffoldBackgroundColor: _white,
      accentColor: CupertinoColors.activeBlue,
      hintColor: CupertinoColors.activeGreen,
      cursorColor: CupertinoColors.activeBlue,
      disabledColor: CupertinoColors.inactiveGray,
      unselectedWidgetColor: Color(0xffE3E9EE),
      indicatorColor: CupertinoColors.placeholderText,
      dividerColor: CupertinoColors.placeholderText,
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: CupertinoColors.placeholderText,
      ),
      iconTheme: IconThemeData(color: CupertinoColors.activeBlue),
      accentIconTheme: IconThemeData(
        color: Color(0xffC6C7D8),
      ),
      textTheme: TextTheme(
          headline1: heading1,
          headline2: heading2,
          headline3: heading3,
          button: button,
          bodyText1: body1,
          bodyText2: body2,
          subtitle1: subtitle1,
          subtitle2: subtitle2),
      colorScheme: ColorScheme.light());

  /// Dark Theme

  static final ThemeData darkTheme = ThemeData(
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        primaryContrastingColor: CupertinoColors.activeBlue,
        scaffoldBackgroundColor: _scaffoldBackground,
      ),
      fontFamily: 'SanFrancisco',
      errorColor: deActivateColor,
      splashColor: Colors.blueAccent,
      primaryColor: CupertinoColors.activeBlue,
      backgroundColor: _background,
      appBarTheme: AppBarTheme(
          color: _appBar,
          iconTheme: IconThemeData(color: CupertinoColors.activeBlue)),
      scaffoldBackgroundColor: _scaffoldBackground,
      accentColor: CupertinoColors.activeBlue,
      hintColor: CupertinoColors.activeGreen,
      cursorColor: CupertinoColors.activeBlue,
      disabledColor: CupertinoColors.inactiveGray,
      unselectedWidgetColor: _darkGrey,
      indicatorColor: CupertinoColors.placeholderText,
      dividerColor: CupertinoColors.placeholderText,
      dividerTheme: DividerThemeData(
        color: Colors.black.withOpacity(0.3),
        thickness: 2,
      ),
      iconTheme: IconThemeData(color: CupertinoColors.activeBlue),
      accentIconTheme: IconThemeData(
        color: Color(0xffC6C7D8),
      ),
      textTheme: TextTheme(
          headline1: heading1.copyWith(color: _white),
          headline2: heading2.copyWith(color: _white),
          headline3: heading3.copyWith(color: _white),
          button: button,
          bodyText1: body1.copyWith(color: _white),
          bodyText2: body2.copyWith(color: _white),
          subtitle1: subtitle1,
          subtitle2: subtitle2.copyWith(color: _lightGrey)),
      colorScheme: ColorScheme.dark());
}
