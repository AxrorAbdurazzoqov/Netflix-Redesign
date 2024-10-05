import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/core/utils/give_height_width.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: context.getWidth * 0.125,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundColor: ColorConst.red,
          child: SvgPicture.asset(IconConst.bell),
        ),
      ),
      title: Text('Notifications', style: FontStyleConst.big),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}