import 'package:json_annotation/json_annotation.dart';
part 'dogos_breed_model.g.dart';

@JsonSerializable()
class DogosBreedModel {
  final Map<String, List<String>> message;
  final String status;

  DogosBreedModel({
    required this.message,
    required this.status,
  });
  factory DogosBreedModel.fromJson(Map<String, dynamic> json) =>
      _$DogosBreedModelFromJson(json);
}
