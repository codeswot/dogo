import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dogo_breed_list.g.dart';

@JsonSerializable()
class DogoBreedList extends Equatable {
  final List<String?> breeds;
  final String? status;

  const DogoBreedList({
    required this.breeds,
    this.status,
  });

  factory DogoBreedList.fromJson(Map<String, dynamic> json) =>
      _$DogoBreedListFromJson(json);

  Map<String, dynamic> toJson() => _$DogoBreedListToJson(this);

  @override
  List<Object?> get props => [breeds, status];
}
