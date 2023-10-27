// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogo_image_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogosList _$DogosListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'DogosList',
      json,
      ($checkedConvert) {
        final val = DogosList(
          urls: $checkedConvert('urls',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DogosListToJson(DogosList instance) => <String, dynamic>{
      'urls': instance.urls,
      'status': instance.status,
    };
