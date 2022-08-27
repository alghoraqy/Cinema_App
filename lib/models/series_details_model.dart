class SeriesDetailsModel {
  final String genre;
  final int runtime;
  SeriesDetailsModel({required this.genre, required this.runtime});

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) {
    return SeriesDetailsModel(
        genre: json['genres'][0]['name'], runtime: json['episode_run_time'][0]);
  }
}
