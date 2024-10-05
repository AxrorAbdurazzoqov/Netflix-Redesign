part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

final class UpcomingMoviesLoading extends UpcomingMoviesState {}

final class UpcomingMoviesSuccess extends UpcomingMoviesState {
  final List<UpcomingMoviesModel> data;

  const UpcomingMoviesSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

final class UpcomingMoviesFailure extends UpcomingMoviesState {
  final String errorMessage;

  const UpcomingMoviesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
