import 'package:json_annotation/json_annotation.dart';
part 'dogo_images_model.g.dart';

@JsonSerializable()
class DogoImagesModel {
  final List<String> message;
  final String status;

  DogoImagesModel({
    required this.message,
    required this.status,
  });

  factory DogoImagesModel.fromJson(Map<String, dynamic> json) =>
      _$DogoImagesModelFromJson(json);
}
