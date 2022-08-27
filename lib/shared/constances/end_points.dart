class EndPoints {
  static const String nowPlaying = '/movie/now_playing';
  static const String topRated = '/movie/top_rated';
  static const String populer = '/movie/popular';
  static String movieDetails(int movieId) {
    return '/movie/$movieId';
  }

  static String getActor(int id) {
    return '/movie/$id/credits';
  }

  ////
  static const String onTheAir = '/tv/on_the_air';
  static const String topRatedSeries = '/tv/top_rated';
  static const String populerSeries = '/tv/popular';
}
