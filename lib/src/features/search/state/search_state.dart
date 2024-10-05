import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final Map data;

  const SearchSuccessState({
     required this.data,
  });

  @override
  List<Object?> get props => [
        data
      ];
}

class SearchResultsState extends SearchState {
  final List result;

  const SearchResultsState({required this.result});
  @override
  List<Object?> get props => [
        result
      ];
}

class SearchErrorState extends SearchState {}
