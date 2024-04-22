/// adult : false
/// backdrop_path : "/xClyQpEcNJ7OSCOfAc4fNuzL9Hi.jpg"
/// genre_ids : [10751,12,80,9648,35]
/// id : 14043
/// original_language : "en"
/// original_title : "Nancy Drew"
/// overview : "Intrepid teenage private eye Nancy Drew heads to Tinseltown with her father to investigate the unsolved murder of a movie star in this old-fashioned whodunit based on Carolyn Keene's popular series of books for young adults. But can the small-town girl cut through the Hollywood hype to solve the case?"
/// popularity : 17.271
/// poster_path : "/a1aAZolyLFRwKhs0IWhFyTa8Z2Z.jpg"
/// release_date : "2007-06-15"
/// title : "Nancy Drew"
/// video : false
/// vote_average : 6.077
/// vote_count : 493
library;

import 'package:movies_app/domain/entities/SimilerEntitie.dart';

class SimilerModel {
  SimilerModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  SimilerModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  SimilerEntitie toSimilerEntitie() {
    return SimilerEntitie(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originalTitle: originalTitle,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        voteAverage: voteAverage);
  }
}
