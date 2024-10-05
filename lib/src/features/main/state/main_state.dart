import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/src/features/coming_soon/presentation/page/coming_soon_screen.dart';
import 'package:netflix_clone/src/features/downloads/page/downloads_screen.dart';
import 'package:netflix_clone/src/features/home/page/home_screen.dart';
import 'package:netflix_clone/src/features/search/page/search_screen.dart';

abstract class MainState extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class MainInitialState extends MainState {
  int index;
  final List pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ComingSoonScreen(),
    const DownloadsScreen(),
    Container(color: Colors.deepPurple),
  ];

  MainInitialState({this.index = 0});

  @override
  List<Object?> get props => [
        index,
      ];
}
