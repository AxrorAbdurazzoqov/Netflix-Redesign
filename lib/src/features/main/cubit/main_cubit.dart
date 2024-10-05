import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/core/constants/color/color_const.dart';
import 'package:netflix_clone/src/features/main/state/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  void changeIndex(i) {
    emit(MainInitialState(index: i));
  }

  dynamic getNavbarColor({required int index, required int currentIndex, required bool isLight}) {
    return index == currentIndex
        ? isLight
            ? ColorConst.black
            : ColorConst.white
        : ColorConst.grey;
  }
}
