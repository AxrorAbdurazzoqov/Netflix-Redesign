import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/core/utils/check_light_theme.dart';
import 'package:netflix_clone/src/features/detail/page/detail_screen.dart';

class CustomRectangleListViewWidget extends StatefulWidget {
  final List res;
  final int i;

  const CustomRectangleListViewWidget({super.key, required this.res, required this.i});

  @override
  State<CustomRectangleListViewWidget> createState() => _CustomRectangleListViewWidgetState();
}

class _CustomRectangleListViewWidgetState extends State<CustomRectangleListViewWidget> {
  @override
  Widget build(BuildContext context) {
    widget.res.shuffle();
    return SizedBox(
      height: 161,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          dynamic result = widget.res[index];
          return widget.i == 1
              ? GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DetailScreen(
                                model: result,
                              ))),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 7),
                        height: 161,
                        width: 103,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(result.image)),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: ColoredBox(
                          color: context.isLight ? ColorConst.grey.withOpacity(0.6) : ColorConst.nightBlack,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5,
                                width: 103,
                                child: LinearProgressIndicator(
                                  minHeight: 5,
                                  value: Random().nextInt(103).toDouble(),
                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                  color: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(IconConst.info),
                                    const SizedBox(width: 31),
                                    SvgPicture.asset(IconConst.threeDots),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DetailScreen(
                                model: result,
                              ))),
                  child: Container(
                    margin: const EdgeInsets.only(right: 7),
                    height: 161,
                    width: 103,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(result.image)),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
