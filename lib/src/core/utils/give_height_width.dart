import 'package:flutter/material.dart';

extension GiveMediaQueryHeightWidth on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight => MediaQuery.of(this).size.width;
}
