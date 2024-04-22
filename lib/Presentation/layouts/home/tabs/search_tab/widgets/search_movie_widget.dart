import 'package:flutter/material.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/core/reusable%20components/movie_widget_for_search_and_watch_list.dart';
import 'package:movies_app/domain/entities/SearchEntitie.dart';

class SearchMovieWidget extends StatelessWidget {
  const SearchMovieWidget({super.key, required this.movie});
  final SearchEntitie movie;
  @override
  Widget build(BuildContext context) {
    return MovieWidgetForSearchAndWatchList(movie: movie, isSearchTab: true,);
  }
}
