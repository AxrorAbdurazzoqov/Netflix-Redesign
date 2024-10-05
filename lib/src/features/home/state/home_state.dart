import 'package:netflix_clone/src/core/model/top100_movies_model.dart';
import 'package:netflix_clone/src/core/model/top100_series_model.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}

class HomeSucces extends HomeState {
  final List<Top100MoviesModel> top100MoviesData;
  final List<Top100SeriesModel> top100SeriesData;

  final List<String> titles = [
    'Previews',
    'Continue Watching',
    'Popular on Netflix',
    'Trending Now',
    'Top 10 in In the World Today',
    'Suggested for you',
    'African Movies',
    'Hollywood Movies & TV',
    'Netflix Originals',
    'Watch It Again',
    'New Releases',
    'TV thrillers & Mysteries',
    'US TV Shows'
  ];

  HomeSucces({required this.top100MoviesData, required this.top100SeriesData});
}
