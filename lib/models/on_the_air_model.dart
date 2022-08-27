class GetOnTheAirModel {
  List<SeriesData> results = [];
  GetOnTheAirModel.fromJson(Map<String, dynamic> json) {
    List.from(json['results']).map((e) {
      results.add(SeriesData.fromJson(e));
    }).toList();
  }
}

class SeriesData {
  final int id;
  final String name;
  final String overview;
  String? poster;
  final String image;
  final dynamic rate;
  final String year;
  SeriesData({
    required this.id,
    required this.name,
    required this.image,
    required this.overview,
    this.poster,
    required this.rate,
    required this.year,
  });

  factory SeriesData.fromJson(Map<String, dynamic> json) {
    return SeriesData(
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        poster: json['backdrop_path'],
        image: json['poster_path'],
        rate: json['vote_average'],
        year: json['first_air_date']);
  }
}
