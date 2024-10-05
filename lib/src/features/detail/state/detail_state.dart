import 'package:equatable/equatable.dart';
import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

class DetailInitialState extends DetailState {
  final List<Map<String, dynamic>> actions = [
    {
      'name': 'My List',
      'icon': IconConst.plus,
    },
    {
      'name': 'Rate',
      'icon': IconConst.like,
    },
    {
      'name': 'Share',
      'icon': IconConst.share,
    },
    {
      'name': 'Download',
      'icon': IconConst.dowload,
    },
  ];

  @override
  List<Object?> get props => [];
}

class DetailErrorState extends DetailState {}
