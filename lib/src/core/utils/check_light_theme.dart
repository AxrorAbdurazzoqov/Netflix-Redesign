import 'package:flutter/material.dart';

extension CheckLightTheme on BuildContext{
  bool get isLight => MediaQuery.of(this).platformBrightness == Brightness.light;
}