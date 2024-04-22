/// backdrop_path : "/8RKBHHRqOMOLh5qW3sS6TSFTd8h.jpg"
/// id : 399579
/// release_date : "2019-01-31"
/// title : "Alita: Battle Angel"

class SearchEntitie {
  SearchEntitie({
      this.backdropPath, 
      this.id, 
      this.releaseDate, 
      this.title,});

  SearchEntitie.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    releaseDate = json['release_date'];
    title = json['title'];
  }
  String? backdropPath;
  num? id;
  String? releaseDate;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['release_date'] = releaseDate;
    map['title'] = title;
    return map;
  }

}