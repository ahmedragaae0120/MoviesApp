/// adult : false
/// backdrop_path : "/atPlFdUrQl2U9MtUwujrrjnQHBA.jpg"
/// id : 654739
/// release_date : "2021-06-23"
/// title : "Hard Hit"
/// vote_average : 7.7

class FilterEntitie {
  FilterEntitie({
      this.adult, 
      this.backdropPath, 
      this.id, 
      this.releaseDate, 
      this.title, 
      this.voteAverage,});

  FilterEntitie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
  bool? adult;
  String? backdropPath;
  num? id;
  String? releaseDate;
  String? title;
  num? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    return map;
  }

}