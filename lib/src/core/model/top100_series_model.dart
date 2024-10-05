import 'package:hive/hive.dart';
import 'dart:convert';

part 'top100_series_model.g.dart'; 

@HiveType(typeId: 3) 
class Top100SeriesModel {
  @HiveField(0)
  final int rank;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final String bigImage;

  @HiveField(5)
  final List<String> genre;

  @HiveField(6)
  final String thumbnail;

  @HiveField(7)
  final double rating;

  @HiveField(8)
  final String id;

  @HiveField(9)
  final String year;

  @HiveField(10)
  final String imdbid;

  @HiveField(11)
  final String imdbLink;

  Top100SeriesModel({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.genre,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.imdbid,
    required this.imdbLink,
  });

  factory Top100SeriesModel.fromRawJson(String str) => Top100SeriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Top100SeriesModel.fromJson(Map<String, dynamic> json) => Top100SeriesModel(
        rank: json["rank"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        bigImage: json["big_image"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        thumbnail: json["thumbnail"],
        rating: json["rating"]?.toDouble(),
        id: json["id"],
        year: json["year"],
        imdbid: json["imdbid"],
        imdbLink: json["imdb_link"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "title": title,
        "description": description,
        "image": image,
        "big_image": bigImage,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "thumbnail": thumbnail,
        "rating": rating,
        "id": id,
        "year": year,
        "imdbid": imdbid,
        "imdb_link": imdbLink,
      };
}