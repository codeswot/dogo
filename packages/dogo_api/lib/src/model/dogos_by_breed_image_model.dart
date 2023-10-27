import 'package:json_annotation/json_annotation.dart';
part 'dogos_by_breed_image_model.g.dart';

@JsonSerializable()
class DogosByBreedImageModel {
  final List<String> message;
  final String status;

  DogosByBreedImageModel({
    required this.message,
    required this.status,
  });
  factory DogosByBreedImageModel.fromJson(Map<String, dynamic> json) =>
      _$DogosByBreedImageModelFromJson(json);
}
