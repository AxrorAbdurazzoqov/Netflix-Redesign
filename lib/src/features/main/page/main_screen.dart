import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/core/utils/check_light_theme.dart';
import 'package:netflix_clone/src/features/main/cubit/main_cubit.dart';
import 'package:netflix_clone/src/features/main/state/main_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic provider = BlocProvider.of<MainCubit>(context, listen: false);
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is MainInitialState) {
            return state.pages[state.index];
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is MainInitialState) {
            return BottomNavigationBar(
              backgroundColor: context.isLight? ColorConst.grey.withOpacity(0.2): ColorConst.nightBlack,
              onTap: (value) {
                provider.changeIndex(value);
              },
              elevation: 0,
              currentIndex: state.index,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: context.isLight ? ColorConst.black : ColorConst.white,
              unselectedItemColor: ColorConst.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      IconConst.home,
                      colorFilter: ColorFilter.mode(provider.getNavbarColor(index: state.index, currentIndex: 0, isLight: context.isLight), BlendMode.srcIn),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    IconConst.search,
                    colorFilter: ColorFilter.mode(provider.getNavbarColor(index: state.index, currentIndex: 1, isLight: context.isLight), BlendMode.srcIn),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                    icon: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset(
                          IconConst.comingSoon,
                          colorFilter: ColorFilter.mode(provider.getNavbarColor(index: state.index, currentIndex: 2, isLight: context.isLight), BlendMode.srcIn),
                        ),
                        Positioned(
                          top: -8,
                          right: -8,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: ColorConst.red,
                            child: FittedBox(
                                child: Text(
                              '4',
                              style: FontStyleConst.smal.copyWith(color: ColorConst.white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            )),
                          ),
                        )
                      ],
                    ),
                    label: 'Coming Soon'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      IconConst.dowload,
                      colorFilter: ColorFilter.mode(provider.getNavbarColor(index: state.index, currentIndex: 3, isLight: context.isLight), BlendMode.srcIn),
                    ),
                    label: 'Downloads'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      IconConst.more,
                      colorFilter: ColorFilter.mode(provider.getNavbarColor(index: state.index, currentIndex: 4, isLight: context.isLight), BlendMode.srcIn),
                    ),
                    label: 'More'),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
