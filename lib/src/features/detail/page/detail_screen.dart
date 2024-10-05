import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/core/utils/check_light_theme.dart';
import 'package:netflix_clone/src/features/detail/cubit/detail_cubit.dart';
import 'package:netflix_clone/src/features/detail/state/detail_state.dart';

class DetailScreen extends StatefulWidget {
  final dynamic model;
  const DetailScreen({super.key, required this.model});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state is DetailInitialState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(widget.model.bigImage), fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SvgPicture.asset(IconConst.netflixLogo, height: 25),
                            const Spacer(),
                            Text(
                              widget.model.rating.toString(),
                              style: FontStyleConst.big.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(CupertinoIcons.star_fill, color: double.parse(widget.model.rating.toString()) ~/ 2 > index ? Colors.yellow : ColorConst.grey);
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(widget.model.title, style: FontStyleConst.large),
                        Row(
                          children: [
                            Text(
                              widget.model.year.toString(),
                              style: FontStyleConst.big.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Row(
                              children: List.generate(widget.model.genre.length > 2 ? 2 : widget.model.genre.length, (index) {
                                return Card(
                                  color: context.isLight ? ColorConst.grey.withOpacity(0.2) : ColorConst.darkGrey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.model.genre[index]),
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                        Text("Description", style: FontStyleConst.large),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(widget.model.description),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            state.actions.length,
                            (index) {
                              return Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        BlocProvider.of<DetailCubit>(context).onTap(index, widget.model);
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      state.actions[index]['icon'],
                                      colorFilter: ColorFilter.mode(
                                        context.isLight
                                            ? ColorConst.nightBlack
                                            : index == 1
                                                ? (BlocProvider.of<DetailCubit>(context).likeModel(widget.model.title) ? ColorConst.red : ColorConst.white)
                                                : ColorConst.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(),
                                  Text(state.actions[index]['name'], style: FontStyleConst.big),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
