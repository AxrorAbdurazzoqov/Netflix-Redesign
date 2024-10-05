import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/core/usecase/usecase.dart';
import 'package:netflix_clone/src/features/coming_soon/data/model/upcoming_movies_model.dart';
import 'package:netflix_clone/src/features/coming_soon/domain/usecase/get_upcoming_movies_usecase.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final GetUpcomingMoviesUsecase getUpcomingMoviesUsecase;
  UpcomingMoviesBloc({required this.getUpcomingMoviesUsecase}) : super(UpcomingMoviesInitial()) {
    on<GetUpcomingMoviesEvent>((event, emit) async {
      final result = await getUpcomingMoviesUsecase.call(NoParams());
      if (result.isRight) {
        emit(UpcomingMoviesSuccess(data: result.right));
      } else {
        emit(UpcomingMoviesFailure(errorMessage: result.left));
      }
    });
  }
}
