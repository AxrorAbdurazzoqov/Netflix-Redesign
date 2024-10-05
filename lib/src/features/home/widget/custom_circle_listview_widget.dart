import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/model/top100_movies_model.dart';
import 'package:netflix_clone/src/features/detail/page/detail_screen.dart';

class CustomCircleListViewWidget extends StatelessWidget {
  final List<Top100MoviesModel> data;

  const CustomCircleListViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          dynamic result = data[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => DetailScreen(
                          model: result,
                        ))),
            child: Padding(
              padding: const EdgeInsets.only(right: 7),
              child: CircleAvatar(
                radius: 51,
                backgroundImage: NetworkImage(result.image),
              ),
            ),
          );
        },
      ),
    );
  }
}
