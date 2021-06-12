import 'dart:convert';

class StationModel {
  String name;
  String imageName;
  String imageType;
  int status;
  StationModel({
    required this.name,
    required this.imageName,
    required this.imageType,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageName': imageName,
      'imageType': imageType,
      'status': status,
    };
  }

  factory StationModel.fromMap(Map<String, dynamic> map) {
    return StationModel(
      name: map['name'],
      imageName: map['imageName'],
      imageType: map['imageType'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StationModel.fromJson(String source) =>
      StationModel.fromMap(json.decode(source));
}
