import 'package:netflix_clone/src/core/either/either.dart';
import 'package:netflix_clone/src/core/usecase/usecase.dart';
import 'package:netflix_clone/src/features/coming_soon/data/model/upcoming_movies_model.dart';
import 'package:netflix_clone/src/features/coming_soon/domain/repository/upcoming_repository.dart';

class GetUpcomingMoviesUsecase extends UseCase<List<UpcomingMoviesModel>, NoParams> {
  final UpcomingRepository _repository;

  GetUpcomingMoviesUsecase({required UpcomingRepository repository}) : _repository = repository;
  @override
  Future<Either<String, List<UpcomingMoviesModel>>> call(NoParams params) async => _repository.getUpcomingMovies();
}
