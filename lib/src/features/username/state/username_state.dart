import 'package:netflix_clone/src/core/constants/icons/icon_const.dart';
import 'package:netflix_clone/src/core/model/username_model.dart';

abstract class UsernameState {}

class UsernameChooseProfileState extends UsernameState{
  List<UsernameModel> usernames = [
    UsernameModel(image: IconConst.emojiBlue, title: 'Emenalo'),
    UsernameModel(image: IconConst.emojiYellow, title: 'Onyeka'),
    UsernameModel(image: IconConst.emojiRed, title: 'Thelma'),
    UsernameModel(image: IconConst.kids, title: 'Kids'),
    UsernameModel(image: '', title: 'Add Profile'),
  ];
}
