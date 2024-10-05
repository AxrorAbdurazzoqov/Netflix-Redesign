import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';

ThemeData get light => ThemeData(
      textTheme: TextTheme(
        headlineSmall: FontStyleConst.smal,
        headlineMedium: FontStyleConst.medium,
        headlineLarge: FontStyleConst.large,
        bodyLarge: FontStyleConst.big,
      ),
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: ColorConst.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConst.white,
      ),
      scaffoldBackgroundColor: ColorConst.white,
    );

ThemeData get dark => ThemeData(
      textTheme: TextTheme(
        headlineSmall: FontStyleConst.smal.copyWith(color: ColorConst.white),
        headlineMedium: FontStyleConst.medium.copyWith(color: ColorConst.white),
        headlineLarge: FontStyleConst.large.copyWith(color: ColorConst.white),
        bodyLarge: FontStyleConst.big.copyWith(color: ColorConst.white),
      ),
      colorScheme: ColorScheme.dark(
        brightness: Brightness.light,
        primary: ColorConst.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConst.black,
      ),
      scaffoldBackgroundColor: ColorConst.black,
    );
