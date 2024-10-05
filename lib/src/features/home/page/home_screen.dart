import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/utils/check_light_theme.dart';
import 'package:netflix_clone/src/features/home/cubit/home_cubit.dart';
import 'package:netflix_clone/src/features/home/state/home_state.dart';
import 'package:netflix_clone/src/features/home/widget/custom_circle_listview_widget.dart';
import 'package:netflix_clone/src/features/home/widget/custom_rectangle_listview_widget.dart';
import 'package:netflix_clone/src/features/home/widget/top_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSucces) {
            return SizedBox(
              child: ListView(
                shrinkWrap: true,
                children: [
                  TopBannerWidget(
                    state: state,
                    random: Random().nextInt(100),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        state.titles.length,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.titles[index],
                              style: FontStyleConst.big.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 14),
                            index == 0 ? CustomCircleListViewWidget(data: state.top100MoviesData) : CustomRectangleListViewWidget(res: index < 10 ? state.top100MoviesData : state.top100SeriesData, i: index),
                            const SizedBox(height: 22),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator.adaptive(backgroundColor: context.isLight ? ColorConst.black : ColorConst.white));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
