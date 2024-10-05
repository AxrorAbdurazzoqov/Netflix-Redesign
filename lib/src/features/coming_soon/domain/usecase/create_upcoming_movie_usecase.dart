import 'package:netflix_clone/src/core/either/either.dart';
import 'package:netflix_clone/src/core/usecase/usecase.dart';
import 'package:netflix_clone/src/features/coming_soon/domain/repository/upcoming_repository.dart';

class CreateUpcomingMovieUsecase extends UseCase {
  final UpcomingRepository _repository;

  CreateUpcomingMovieUsecase({required UpcomingRepository repository}) : _repository = repository;

  @override
  Future<Either> call(params) => _repository.createUpcomingMovie(params);
}
