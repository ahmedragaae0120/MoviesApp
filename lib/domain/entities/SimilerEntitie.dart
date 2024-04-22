/// adult : false
/// backdrop_path : "/tym6NH7ybFeldBuYYp0RSLpjZFq.jpg"
/// genre_ids : [14,16,35,80]
/// id : 856
/// original_title : "Who Framed Roger Rabbit"
/// poster_path : "/lYfRc57Kx9VgLZ48iulu0HKnM15.jpg"
/// release_date : "1988-06-21"
/// title : "Who Framed Roger Rabbit"
/// vote_average : 7.523

class SimilerEntitie {
  SimilerEntitie({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalTitle, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.voteAverage,});

  SimilerEntitie.fromJson(dynamic json) {
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