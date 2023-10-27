import 'package:json_annotation/json_annotation.dart';
part 'dogo_random_image_model.g.dart';

@JsonSerializable()
class DogoRandomImageModel {
  final String message;
  final String status;

  DogoRandomImageModel({
    required this.message,
    required this.status,
  });

  factory DogoRandomImageModel.fromJson(Map<String, dynamic> json) =>
      _$DogoRandomImageModelFromJson(json);
}
