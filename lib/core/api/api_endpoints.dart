class EndPoints {
  static const String populerEndPoint = "/3/movie/popular";
  static const String upcomingEndPoint = "/3/movie/upcoming";
  static const String topRatedEndPoint = "/3/movie/top_rated";
  static const String categoryEndPoint = "/3/genre/movie/list";
  static String movieDetailsEndPoint({required num movieId}) =>
      "/3/movie/$movieId";
  static String searchEndPoint = "/3/search/movie";
  static String filterEndPoint = "/3/discover/movie";
}
