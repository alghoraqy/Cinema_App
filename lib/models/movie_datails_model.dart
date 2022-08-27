class MovieDetailsModel {
  final String genre;
  final int runtime;
  MovieDetailsModel({required this.genre, required this.runtime});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        genre: json['genres'][0]['name'], runtime: json['runtime']);
  }
}
