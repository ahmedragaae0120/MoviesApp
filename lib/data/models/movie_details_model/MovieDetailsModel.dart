import 'package:movies_app/data/models/categories/Genres.dart';
import 'package:movies_app/domain/entities/MovieDetailsEntitie.dart';

import 'ProductionCompanies.dart';
import 'ProductionCountries.dart';
import 'SpokenLanguages.dart';

/// adult : false
/// backdrop_path : "/4i3Amppd6eW5Qkhjv4gdHk3CCoE.jpg"
/// belongs_to_collection : null
/// budget : 18000000
/// genres : [{"id":36,"name":"History"},{"id":10402,"name":"Music"},{"id":18,"name":"Drama"}]
/// homepage : ""
/// id : 279
/// imdb_id : "tt0086879"
/// original_language : "en"
/// original_title : "Amadeus"
/// overview : "Wolfgang Amadeus Mozart is a remarkably talented young Viennese composer who unwittingly finds a fierce rival in the disciplined and determined Antonio Salieri. Resenting Mozart for both his hedonistic lifestyle and his undeniable talent, the highly religious Salieri is gradually consumed by his jealousy and becomes obsessed with Mozart's downfall, leading to a devious scheme that has dire consequences for both men."
/// popularity : 38.125
/// poster_path : "/1n5VUlCqgmVax1adxGZm8oCFaKc.jpg"
/// production_companies : [{"id":5237,"logo_path":"/mlnr7vsBHvLye8oEb5A76C0t8x9.png","name":"The Saul Zaentz Company","origin_country":"US"},{"id":1869,"logo_path":null,"name":"AMLF","origin_country":"FR"},{"id":41,"logo_path":"/xAot4SSOIHiWQ2WEnVXYGR1lce9.png","name":"Orion Pictures","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"FR","name":"France"},{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "1984-09-19"
/// revenue : 90000000
/// runtime : 161
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"},{"english_name":"Italian","iso_639_1":"it","name":"Italiano"},{"english_name":"Latin","iso_639_1":"la","name":"Latin"},{"english_name":"German","iso_639_1":"de","name":"Deutsch"}]
/// status : "Released"
/// tagline : "Everything you've heard is true..."
/// title : "Amadeus"
/// video : false
/// vote_average : 8.038
/// vote_count : 4016

class MovieDetailsModel {
  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieDetailsModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  MovieDetailsEntitie toMovieDetailsEntitie() {
    return MovieDetailsEntitie(
        adult: adult,
        backdropPath: backdropPath,
        genres: genres,
        id: id,
        originalTitle: originalTitle,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        timeOfMovie: runtime,
        title: title,
        voteAverage: voteAverage);
  }
}
