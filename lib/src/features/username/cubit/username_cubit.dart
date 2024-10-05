import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/features/main/page/main_screen.dart';
import 'package:netflix_clone/src/features/username/state/username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(UsernameChooseProfileState());

  void chooseProfile(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }
}
