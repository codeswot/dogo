import 'package:json_annotation/json_annotation.dart';
part 'dogos_sub_breed_model.g.dart';

@JsonSerializable()
class DogosSubBreedModel {
  final List<String> message;
  final String status;

  DogosSubBreedModel({
    required this.message,
    required this.status,
  });

  factory DogosSubBreedModel.fromJson(Map<String, dynamic> json) =>
      _$DogosSubBreedModelFromJson(json);
}
