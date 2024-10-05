import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:netflix_clone/src/core/repository/netflix_repository.dart';
import 'package:netflix_clone/src/features/home/state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  Future<void> get getDatas async {
  //   try {
  //     final moviesData = await NetflixRepository.instance.getTop100MoviewList;
  //     final seriesData = await NetflixRepository.instance.getTop100SeriesList;
  //     emit(HomeSucces(top100MoviesData: moviesData, top100SeriesData: seriesData));
  //   } catch (e) {
  //     emit(HomeError());
  //   }
  }
}
