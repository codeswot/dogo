import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dogo_sub_breed_list.g.dart';

@JsonSerializable()
class DogoSubBreedList extends Equatable {
  final List<String> subBreeds;
  final String? status;

  const DogoSubBreedList({
    required this.subBreeds,
    this.status,
  });

  factory DogoSubBreedList.fromJson(Map<String, dynamic> json) =>
      _$DogoSubBreedListFromJson(json);

  Map<String, dynamic> toJson() => _$DogoSubBreedListToJson(this);

  @override
  List<Object?> get props => [subBreeds, status];
}
