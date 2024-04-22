/// backdrop_path : "/sR0SpCrXamlIkYMdfz83sFn5JS6.jpg"
/// genre_ids : [28,878,12,14]
/// id : 823464
/// poster_path : "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg"
library;

class UpcomingEntitie {
  UpcomingEntitie(
      {this.releaseDate,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.posterPath,
      this.title});

  UpcomingEntitie.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    posterPath = json['poster_path'];
    title = json["title"];
    releaseDate = json["releaseDate"];
  }
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? posterPath;
  String? title;
  String? releaseDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['poster_path'] = posterPath;
    map['title'] = title;
    map["releaseDate"] = releaseDate;
    return map;
  }
}
