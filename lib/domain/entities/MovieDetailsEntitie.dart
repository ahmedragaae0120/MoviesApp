/// adult : false
/// backdrop_path : "/4i3Amppd6eW5Qkhjv4gdHk3CCoE.jpg"
/// genres : [{"id":36,"name":"History"},{"id":10402,"name":"Music"},{"id":18,"name":"Drama"}]
/// id : 279
/// original_title : "Amadeus"
/// overview : "Wolfgang Amadeus Mozart is a remarkably talented young Viennese composer who unwittingly finds a fierce rival in the disciplined and determined Antonio Salieri. Resenting Mozart for both his hedonistic lifestyle and his undeniable talent, the highly religious Salieri is gradually consumed by his jealousy and becomes obsessed with Mozart's downfall, leading to a devious scheme that has dire consequences for both men."
/// poster_path : "/1n5VUlCqgmVax1adxGZm8oCFaKc.jpg"
/// release_date : "1984-09-19"
/// runtime : 161
/// title : "Amadeus"
/// vote_average : 8.038
library;

import '../../data/models/categories/Genres.dart';

class MovieDetailsEntitie {
  MovieDetailsEntitie({
    this.adult,
    this.backdropPath,
    this.genres,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.timeOfMovie,
    this.title,
    this.voteAverage,
  });

  MovieDetailsEntitie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    timeOfMovie = json['runtime'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
  bool? adult;
  String? backdropPath;
  List<Genres>? genres;
  num? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  num? timeOfMovie;
  String? title;
  num? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['runtime'] = timeOfMovie;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    return map;
  }
}
