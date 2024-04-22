/// adult : false
/// backdrop_path : "/sR0SpCrXamlIkYMdfz83sFn5JS6.jpg"
/// genre_ids : [28,878,12,14]
/// id : 823464
/// original_title : "Godzilla x Kong: The New Empire"
/// poster_path : "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg"
/// release_date : "2024-03-27"
/// title : "Godzilla x Kong: The New Empire"

class PopularEntitie {
  PopularEntitie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  PopularEntitie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
  }
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalTitle;
  String? posterPath;
  String? releaseDate;
  String? title;

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
    return map;
  }
}
