import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/core/model/top100_movies_model.dart';
import 'package:netflix_clone/src/core/model/top100_series_model.dart';
import 'package:netflix_clone/src/core/repository/netflix_repository.dart';
import 'package:netflix_clone/src/features/search/state/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchLoadingState());

  Map result = {};

  void getTopSearched() async {
    try {
      final List<Top100MoviesModel> top100MoviesData = await NetflixRepository.instance.getTop100MoviewList;
      final List<Top100SeriesModel> top100SeriesData = await NetflixRepository.instance.getTop100SeriesList;

      top100MoviesData.forEach((mp) {
        result[mp.rank] = mp;
      });
      top100SeriesData.forEach((mp) {
        result[mp.rank + 100] = mp;
      });
      emit(SearchSuccessState(data: result));
    } catch (e) {
      emit(SearchErrorState());
    }
  }

  void search(String value) {
    if (value.length >= 3) {
      List results = [];

      (state as SearchSuccessState).data.forEach((key, val) {
        if (val.title.toLowerCase().contains(value.toLowerCase())) {
          results.add(val);
        }
      });

      emit(SearchResultsState(result: results));
      print('Result: $results');
    } else {
      emit(SearchSuccessState(data: result));
    }
  }
}
