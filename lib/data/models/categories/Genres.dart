/// id : 28
/// name : "Action"

class Genres {
  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
  static List<String> categoriesImagesList =[
    "Action .jpeg",
    "Adventure.png",
    "Animation.jpg",
    "comedy.jpg",
    "Crime.jpg",
    "Documentary.jpg",
    "Drama.jpg",
    "Family.jpg",
    "fantasy .jpg",
    "History.png",
    "Horror.jpg",
    "Music.png",
    "Mystery.jpeg",
    "romantic .jpeg",
    "Science Fiction.jpg",
    "TV-Movie.jpg",
    "Thriller.jpeg",
    "war.jpg",
    "Western.jpg",



  ];
}
