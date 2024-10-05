import 'package:dio/dio.dart';
import 'package:netflix_clone/src/core/constants/key/api_key.dart';
import 'package:netflix_clone/src/core/model/top100_movies_model.dart';
import 'package:netflix_clone/src/core/model/top100_series_model.dart';
import 'package:netflix_clone/src/core/utils/check_connection.dart';

class NetflixRepository {
  // ! Singleton
  static NetflixRepository get instance => NetflixRepository.init();
  NetflixRepository.init();

  Future get getTop100MoviewList async {
    try {
      final Response response = await Dio().get(
        'https://imdb-top-100-movies.p.rapidapi.com/',
        options: Options(
          headers: {
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": "imdb-top-100-movies.p.rapidapi.com",
          },
        ),
      );
      if (response.isSucces) {
        return (response.data as List).map((mp) => Top100MoviesModel.fromJson(mp)).toList();
      } else {
        throw Exception('Error ${response.statusMessage}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future get getTop100SeriesList async {
    try {
      final Response response = await Dio().get(
        'https://imdb-top-100-movies.p.rapidapi.com/series/',
        options: Options(
          headers: {
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": "imdb-top-100-movies.p.rapidapi.com",
          },
        ),
      );
      if (response.isSucces) {
        return (response.data as List).map((mp) => Top100SeriesModel.fromJson(mp)).toList();
      } else {
        throw Exception('Error ${response.statusMessage}');
      }
    } catch (e) {
      rethrow;
    }
  }
}