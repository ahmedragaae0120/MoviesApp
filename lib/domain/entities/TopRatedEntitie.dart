/// adult : false
/// backdrop_path : "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg"
/// genre_ids : [18,80]
/// id : 278
/// original_title : "The Shawshank Redemption"
/// poster_path : "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg"
/// release_date : "1994-09-23"
/// title : "The Shawshank Redemption"
/// vote_average : 8.704
library;

class TopRatedEntitie {
  TopRatedEntitie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  TopRatedEntitie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalTitle;
  String? posterPath;
  String? releaseDate;
  String? title;
  num? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_title'] = originalTitle;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    return map;
  }
}
