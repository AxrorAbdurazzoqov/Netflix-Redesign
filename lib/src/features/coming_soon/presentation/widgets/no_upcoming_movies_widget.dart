import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';

class UserExplainWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const UserExplainWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: ColorConst.grey),
        const SizedBox(height: 20),
        Text(
          title,
          style: FontStyleConst.large.copyWith(color: ColorConst.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
