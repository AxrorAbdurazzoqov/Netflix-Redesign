import 'dart:convert';

List<UpcomingMoviesModel> upcomingMoviesModelFromJson(String str) => List<UpcomingMoviesModel>.from(json.decode(str).map((x) => UpcomingMoviesModel.fromJson(x)));

String upcomingMoviesModelToJson(List<UpcomingMoviesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpcomingMoviesModel {
    final int id;
    final String documentId;
    final String movieName;
    final DateTime releaseDate;
    final String genre;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime publishedAt;
    final dynamic locale;

    UpcomingMoviesModel({
        required this.id,
        required this.documentId,
        required this.movieName,
        required this.releaseDate,
        required this.genre,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.locale,
    });

    factory UpcomingMoviesModel.fromJson(Map<String, dynamic> json) => UpcomingMoviesModel(
        id: json["id"],
        documentId: json["documentId"],
        movieName: json["movie_name"],
        releaseDate: DateTime.parse(json["release_date"]),
        genre: json["genre"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "movie_name": movieName,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "genre": genre,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": locale,
    };
}