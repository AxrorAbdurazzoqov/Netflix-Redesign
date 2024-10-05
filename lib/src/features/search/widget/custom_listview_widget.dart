import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/features/detail/page/detail_screen.dart';
import 'package:netflix_clone/src/features/search/state/search_state.dart';

class CustomListViewWidget extends StatelessWidget {
  final SearchSuccessState state;

  const CustomListViewWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 60,
      itemBuilder: (context, index) {
        dynamic data = state.data[index + 70];
        return Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: 80,
          width: double.infinity,
          child: ListTile(
            leading: Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(data.image), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              data.title,
              style: FontStyleConst.medium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => DetailScreen(model: data),
                ),
              ),
              icon: SvgPicture.asset(IconConst.info),
            ),
          ),
        );
      },
    );
  }
}
