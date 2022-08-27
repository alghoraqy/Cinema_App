class NowPlayingModel {
  List<MovieData> results = [];
  NowPlayingModel.fromJson(Map<String, dynamic> json) {
    List.from(json['results']).map((e) {
      results.add(MovieData.fromJson(e));
    }).toList();
  }
}

class MovieData {
  final int id;
  final int genreId;
  final String title;
  final String overview;
  final String poster;
  final String image;
  final dynamic rate;
  final String year;
  MovieData({
    required this.id,
    required this.genreId,
    required this.title,
    required this.image,
    required this.overview,
    required this.poster,
    required this.rate,
    required this.year,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
        id: json['id'],
        genreId: json['genre_ids'][0],
        title: json['title'],
        overview: json['overview'],
        poster: json['backdrop_path'],
        image: json['poster_path'],
        rate: json['vote_average'],
        year: json['release_date']);
  }
}
