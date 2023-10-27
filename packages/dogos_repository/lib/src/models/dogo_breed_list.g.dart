// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogo_breed_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogoBreedList _$DogoBreedListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DogoBreedList',
      json,
      ($checkedConvert) {
        final val = DogoBreedList(
          breeds: $checkedConvert('breeds',
              (v) => (v as List<dynamic>).map((e) => e as String?).toList()),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DogoBreedListToJson(DogoBreedList instance) =>
    <String, dynamic>{
      'breeds': instance.breeds,
      'status': instance.status,
    };
