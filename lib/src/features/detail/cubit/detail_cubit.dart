import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/core/model/local_db_model.dart';
import 'package:netflix_clone/src/core/repository/hive_service.dart';
import 'package:netflix_clone/src/features/detail/state/detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitialState());

  void onTap(index, model) {
    if (index == 0) {
      HiveService.instantiate.writeData(key: model.title, value: LocalDbModel(model: model));
    } else if (index == 1) {
      HiveService.instantiate.writeData(key: model.title, value: LocalDbModel(model: model, isLiked: true));
    } else if (index == 3) {
      HiveService.instantiate.writeData(key: model.title, value: LocalDbModel(model: model, isDownloaded: true));
    }
  }

  bool likeModel(String key) {
    final model = HiveService.instantiate.readData(key: key);
    return model?.isLiked ?? false;
  }

  bool downloadModel(String key) {
    final model = HiveService.instantiate.readData(key: key);
    return model?.isDownloaded ?? false;
  }
}
