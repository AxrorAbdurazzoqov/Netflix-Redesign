import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/core/utils/check_light_theme.dart';
import 'package:netflix_clone/src/core/utils/give_height_width.dart';
import 'package:netflix_clone/src/features/detail/page/detail_screen.dart';
import 'package:netflix_clone/src/features/home/state/home_state.dart';

class TopBannerWidget extends StatelessWidget {
  final HomeSucces state;
  final int random;
  const TopBannerWidget({
    super.key,
    required this.state,
    required this.random,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.getHeight,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(state.top100MoviesData[random].bigImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: context.getHeight * 0.02,
                left: context.getWidth * 0.05,
                child: Row(
                  children: [
                    SvgPicture.asset(IconConst.netflixIcon),
                    TextButton(onPressed: () {}, child: Text('TV Shows', style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: ColorConst.white))),
                    TextButton(onPressed: () {}, child: Text('Movies', style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: ColorConst.white))),
                    TextButton(onPressed: () {}, child: Text('My List', style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: ColorConst.white))),
                  ],
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: context.getWidth * 0.23,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        random < 10 ? SvgPicture.asset(IconConst.top10, height: 30) : const SizedBox(),
                        const SizedBox(width: 10),
                        Text(
                          '#${state.top100MoviesData[random].rank} in The World',
                          style: FontStyleConst.big.copyWith(color: ColorConst.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(
                  CupertinoIcons.plus,
                  color: context.isLight ? ColorConst.black : ColorConst.white,
                  size: 24,
                ),
                const Text('My List')
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                decoration: BoxDecoration(
                  color: context.isLight ? ColorConst.grey : ColorConst.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      size: 40,
                      CupertinoIcons.play_arrow_solid,
                      color: context.isLight ? ColorConst.white : ColorConst.black,
                    ),
                    Text('Play', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: context.isLight ? ColorConst.white : ColorConst.black)),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => DetailScreen(
                          model: state.top100MoviesData[random],
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.info_outline, color: context.isLight ? ColorConst.black : ColorConst.white, size: 24),
                ),
                const Text('Info')
              ],
            ),
          ],
        ),
      ],
    );
  }
}
