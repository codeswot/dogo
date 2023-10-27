// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogo_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dogo _$DogoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Dogo',
      json,
      ($checkedConvert) {
        final val = Dogo(
          url: $checkedConvert('url', (v) => v as String),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DogoToJson(Dogo instance) => <String, dynamic>{
      'url': instance.url,
      'status': instance.status,
    };
