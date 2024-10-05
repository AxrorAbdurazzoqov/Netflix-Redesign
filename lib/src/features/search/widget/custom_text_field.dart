import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/core/utils/check_light_theme.dart';
import 'package:netflix_clone/src/features/search/cubit/search_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: double.infinity,
      child: TextField(
        onChanged: (value) {
            BlocProvider.of<SearchCubit>(context).search(value);
        },
        controller: _searchController,
        cursorColor: ColorConst.grey,
        decoration: InputDecoration(filled: true, fillColor: context.isLight ? ColorConst.grey : ColorConst.darkGrey, hintText: 'Search for a show,movie,genre and etc.', hintStyle: FontStyleConst.smal.copyWith(color: ColorConst.white), prefixIcon: IconButton(onPressed: () {}, icon: SvgPicture.asset(IconConst.search, colorFilter: ColorFilter.mode(ColorConst.white, BlendMode.srcIn))), suffixIcon: IconButton(onPressed: () {}, icon: SvgPicture.asset(IconConst.microphone))),
      ),
    );
  }
}
