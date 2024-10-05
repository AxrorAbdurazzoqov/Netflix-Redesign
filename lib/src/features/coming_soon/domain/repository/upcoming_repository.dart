import 'package:netflix_clone/src/core/either/either.dart';
import 'package:netflix_clone/src/features/coming_soon/data/model/upcoming_movies_model.dart';

abstract class UpcomingRepository {
  Future<Either<String, List<UpcomingMoviesModel>>> getUpcomingMovies();
  Future<Either<String, void>> createUpcomingMovie(UpcomingMoviesModel model);
}
