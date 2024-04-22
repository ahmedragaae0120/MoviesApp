import 'package:movies_app/domain/entities/SearchEntitie.dart';

/// adult : false
/// backdrop_path : "/6tuNQ16hC4Qp7wjTweKzUnnLBkI.jpg"
/// genre_ids : [27,9648]
/// id : 565
/// original_language : "en"
/// original_title : "The Ring"
/// overview : "Rachel Keller is a journalist investigating a videotape that may have killed four teenagers. There is an urban legend about this tape: the viewer will die seven days after watching it. Rachel tracks down the video... and watches it. Now she has just seven days to unravel the mystery of the Ring so she can save herself and her son."
/// popularity : 36.754
/// poster_path : "/gghD2ZIPjMzLnnBuT3AZQGYnIW9.jpg"
/// release_date : "2002-10-18"
/// title : "The Ring"
/// video : false
/// vote_average : 6.664
/// vote_count : 5919

class SearchResults {
  SearchResults({
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

  SearchResults.fromJson(dynamic json) {
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

  SearchEntitie toSearchEntitie() {
    return SearchEntitie(
        backdropPath: backdropPath,
        id: id,
        releaseDate: releaseDate,
        title: title);
  }
}
