class GetActorModel {
  List<ActorData> cast = [];
  GetActorModel.fromJson(Map<String, dynamic> json) {
    List.from(json['cast']).map((e) {
      cast.add(ActorData.fromJson(e));
    }).toList();
  }
}

class ActorData {
  final dynamic id;
  final dynamic name;
  final dynamic image;
  final dynamic character;
  ActorData({
    required this.id,
    required this.name,
    required this.image,
    required this.character,
  });

  factory ActorData.fromJson(Map<String, dynamic> json) {
    return ActorData(
      id: json['id'],
      name: json['name'],
      image: json['profile_path'],
      character: json['character'],
    );
  }
}
