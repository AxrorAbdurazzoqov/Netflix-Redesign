import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/core/constants/theme/app_theme.dart';
import 'package:netflix_clone/src/core/repository/hive_service.dart';
import 'package:netflix_clone/src/features/coming_soon/data/data_source/coming_soon_data_source.dart';
import 'package:netflix_clone/src/features/coming_soon/data/repository/upcoming_repository_impl.dart';
import 'package:netflix_clone/src/features/coming_soon/domain/usecase/get_upcoming_movies_usecase.dart';
import 'package:netflix_clone/src/features/coming_soon/presentation/bloc/bloc/upcoming_movies_bloc.dart';
import 'package:netflix_clone/src/features/detail/cubit/detail_cubit.dart';
import 'package:netflix_clone/src/features/home/cubit/home_cubit.dart';
import 'package:netflix_clone/src/features/main/cubit/main_cubit.dart';
import 'package:netflix_clone/src/features/main/page/main_screen.dart';
import 'package:netflix_clone/src/features/search/cubit/search_cubit.dart';
import 'package:netflix_clone/src/features/username/cubit/username_cubit.dart';

void main() async {
  final Dio dio = Dio();
  HiveService.instantiate.createBox();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsernameCubit()),
        BlocProvider(create: (create) => MainCubit()),
        BlocProvider(create: (create) => HomeCubit()),
        BlocProvider(create: (create) => HomeCubit()..getDatas),
        BlocProvider(create: (create) => SearchCubit()),
        BlocProvider(create: (create) => DetailCubit()),
        BlocProvider(
          create: (context) => UpcomingMoviesBloc(
            getUpcomingMoviesUsecase: GetUpcomingMoviesUsecase(
              repository: UpcomingRepositoryImpl(
                dataSource: ComingSoonDataSourceImpl(
                  dio: dio,
                ),
              ),
            ),
          ),
        ),
      ],
      child: const Netflix(),
    ),
  );
}

class Netflix extends StatelessWidget {
  const Netflix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
