import 'package:hive_flutter/hive_flutter.dart';

part 'local_db_model.g.dart';

@HiveType(typeId: 1)

class LocalDbModel {
  @HiveField(0)
  final dynamic model;
  @HiveField(1)
  final bool isLiked;
  @HiveField(2)
  final bool isDownloaded;

  LocalDbModel({required this.model, this.isLiked=false, this.isDownloaded=false});
}
