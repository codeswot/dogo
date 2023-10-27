import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dogo_image.g.dart';

@JsonSerializable()
class Dogo extends Equatable {
  final String url;
  final String? status;

  const Dogo({
    required this.url,
    this.status,
  });

  factory Dogo.fromJson(Map<String, dynamic> json) => _$DogoFromJson(json);

  Map<String, dynamic> toJson() => _$DogoToJson(this);

  @override
  List<Object?> get props => [url, status];
}
