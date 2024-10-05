import 'package:netflix_clone/src/core/either/either.dart';
import 'package:netflix_clone/src/features/coming_soon/data/data_source/coming_soon_data_source.dart';
import 'package:netflix_clone/src/features/coming_soon/data/model/upcoming_movies_model.dart';
import 'package:netflix_clone/src/features/coming_soon/domain/repository/upcoming_repository.dart';

class UpcomingRepositoryImpl extends UpcomingRepository {
  final ComingSoonDataSource _dataSource;

  UpcomingRepositoryImpl({required ComingSoonDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<String, List<UpcomingMoviesModel>>> getUpcomingMovies() async {
    try {
      final List<UpcomingMoviesModel> result = await _dataSource.getUpcomingMovies();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> createUpcomingMovie(UpcomingMoviesModel model)async {
    try {
      final result = await _dataSource.createUpcomingMovie(model);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
