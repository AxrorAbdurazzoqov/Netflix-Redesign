import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/core/utils/check_light_theme.dart';
import 'package:netflix_clone/src/features/username/cubit/username_cubit.dart';
import 'package:netflix_clone/src/features/username/state/username_state.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: 'netflix',
          child: Material(
            child: SvgPicture.asset(
              IconConst.netflixLogo,
              height: 37.2,
            ),
          ),
        ),
        actions: [
          SvgPicture.asset(
            IconConst.pencil,
            colorFilter: ColorFilter.mode(context.isLight ? ColorConst.black : ColorConst.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 25),
        ],
      ),
      body: BlocBuilder<UsernameCubit, UsernameState>(
        builder: (context, state) {
          if (state is UsernameChooseProfileState) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 15,
                ),
                itemCount: state.usernames.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<UsernameCubit>(context).chooseProfile(context);
                    },
                    child: Column(
                      children: [
                        state.usernames[index].image.isEmpty
                            ? Icon(
                                CupertinoIcons.add_circled_solid,
                                size: 80,
                                color: context.isLight ? ColorConst.black : ColorConst.white,
                              )
                            : Image.asset(state.usernames[index].image),
                        const SizedBox(height: 20),
                        Text(state.usernames[index].title, style: FontStyleConst.medium),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
