import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dogo_image_list.g.dart';

@JsonSerializable()
class DogosList extends Equatable {
  final List<String> urls;
  final String? status;

  const DogosList({
    required this.urls,
    this.status,
  });

  factory DogosList.fromJson(Map<String, dynamic> json) =>
      _$DogosListFromJson(json);

  Map<String, dynamic> toJson() => _$DogosListToJson(this);

  @override
  List<Object?> get props => [urls, status];
}
