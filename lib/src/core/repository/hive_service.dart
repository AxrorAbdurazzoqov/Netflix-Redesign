import 'package:hive_flutter/hive_flutter.dart';
import 'package:netflix_clone/src/core/model/local_db_model.dart';
import 'package:netflix_clone/src/core/model/top100_movies_model.dart';
import 'package:netflix_clone/src/core/model/top100_series_model.dart';

class HiveService {
  static late Box box;
  static const netflixBox = 'netflix_box';

  //! Singleton
  static HiveService get instantiate => HiveService.init();
  HiveService.init();

  //! init
  void createBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LocalDbModelAdapter());
    Hive.registerAdapter(Top100MoviesModelAdapter());
    Hive.registerAdapter(Top100SeriesModelAdapter());
    box = await Hive.openBox(netflixBox);
  }

  //! write
  void writeData({required key, required value}) async {
    await box.put(key, value);
    print('write ${[
      key,
      value
    ]}');
  }

  //! read
  dynamic readData({required key}) {
    print(box.get(key));
    return box.get(key);
  }

  //! read all
  Map get readAllData {
    return box.toMap();
  }

  //! delete
  void deleteData({required key}) {
    box.delete(key);
    print('Deleted $key');
  }
}
