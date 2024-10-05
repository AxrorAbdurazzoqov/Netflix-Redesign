import 'package:dio/dio.dart';
import 'package:netflix_clone/src/core/utils/check_connection.dart';
import 'package:netflix_clone/src/features/coming_soon/data/model/upcoming_movies_model.dart';

abstract class ComingSoonDataSource {
  Future<List<UpcomingMoviesModel>> getUpcomingMovies();
  Future<void> createUpcomingMovie(UpcomingMoviesModel data);
}

class ComingSoonDataSourceImpl extends ComingSoonDataSource {
  final Dio _dio;

  ComingSoonDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<UpcomingMoviesModel>> getUpcomingMovies() async {
    try {
      final response = await _dio.get('http://192.168.1.31:1337/api/the-upcoming-movies');

      if (response.isSucces) {
        return (response.data['data'] as List).map((mp) => UpcomingMoviesModel.fromJson(mp)).toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createUpcomingMovie(data) async {
    try {
      final Response response = await Dio().post('http://192.168.1.31:1337/api/the-upcoming-movies', data: data);

      if (!response.isSucces) throw Exception(response.statusMessage);
    } catch (e) {
      rethrow;
    }
  }
}
