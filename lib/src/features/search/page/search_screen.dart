import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/utils/check_light_theme.dart';
import 'package:netflix_clone/src/features/detail/page/detail_screen.dart';
import 'package:netflix_clone/src/features/search/cubit/search_cubit.dart';
import 'package:netflix_clone/src/features/search/state/search_state.dart';
import 'package:netflix_clone/src/features/search/widget/custom_listview_widget.dart';
import 'package:netflix_clone/src/features/search/widget/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchCubit>(context, listen: false).getTopSearched();
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccessState) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(searchController: _searchController),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                    child: Text("Top Searches", style: FontStyleConst.large.copyWith(fontWeight: FontWeight.w700)),
                  ),
                  Expanded(
                    child: CustomListViewWidget(state: state),
                  ),
                ],
              ),
            );
          } else if (state is SearchLoadingState) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: context.isLight ? ColorConst.black : ColorConst.white,
              ),
            );
          } else if (state is SearchResultsState) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(searchController: _searchController),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                    child: Text("Top Searches", style: FontStyleConst.large.copyWith(fontWeight: FontWeight.w700)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.result.length,
                      itemBuilder: (context, index) {
                        dynamic data = state.result[index];
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
                              icon: Icon(Icons.play_circle_outlined, color: ColorConst.darkGrey),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
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
