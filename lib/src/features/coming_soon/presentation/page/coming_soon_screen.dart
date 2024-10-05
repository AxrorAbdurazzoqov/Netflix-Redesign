import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/features/coming_soon/presentation/bloc/bloc/upcoming_movies_bloc.dart';
import 'package:netflix_clone/src/features/coming_soon/presentation/widgets/custom_app_bar.dart';
import 'package:netflix_clone/src/features/coming_soon/presentation/widgets/no_upcoming_movies_widget.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UpcomingMoviesBloc>(context).add(GetUpcomingMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {

        },
      ),
      body: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (context, state) {
          if (state is UpcomingMoviesSuccess) {
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                context.read<UpcomingMoviesBloc>().add(GetUpcomingMoviesEvent());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    state.data.isEmpty
                        ? const Center(
                            child: UserExplainWidget(
                              icon: Icons.movie_creation_outlined,
                              title: 'No Upcoming Movies',
                            ),
                          )
                        : Expanded(
                            child: Scrollbar(
                              radius: const Radius.circular(20),
                              interactive: true,
                              child: ListView.separated(
                                itemCount: state.data.length,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(right: 10),
                                separatorBuilder: (context, index) => const SizedBox(height: 20),
                                itemBuilder: (context, index) {
                                  final data = state.data[index];
                                  return Card.outlined(
                                    child: ListTile(
                                      title: Text(data.movieName),
                                      subtitle: Text("${data.releaseDate.day}/${data.releaseDate.month}/${data.releaseDate.year}"),
                                      trailing: IconButton(
                                        onPressed: () {
                                          Dio().delete('http://192.168.1.31:1337/api/the-upcoming-movies/${data.documentId}');
                                          setState(() {
                                            state.data.removeAt(index);
                                          });
                                        },
                                        icon: const Icon(CupertinoIcons.trash),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          } else if (state is UpcomingMoviesFailure) {
            return const Center(
              child: UserExplainWidget(
                icon: Icons.error_outline_sharp,
                title: 'Something went wrong',
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
