import 'package:cinema_app/models/now_playing_model.dart';

class TopRatedModel {
  List<MovieData> results = [];
  TopRatedModel.fromJson(Map<String, dynamic> json) {
    List.from(json['results']).map((e) {
      results.add(MovieData.fromJson(e));
    }).toList();
  }
}
