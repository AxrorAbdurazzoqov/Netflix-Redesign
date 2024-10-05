part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesEvent extends Equatable {
  const UpcomingMoviesEvent();
}

class GetUpcomingMoviesEvent extends UpcomingMoviesEvent {
  
  @override
  List<Object?> get props => [];
}

class CreateUpcomingMovieEvent extends UpcomingMoviesEvent {
  @override
  List<Object?> get props => [];

}