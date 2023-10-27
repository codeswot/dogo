// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogo_sub_breed_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogoSubBreedList _$DogoSubBreedListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DogoSubBreedList',
      json,
      ($checkedConvert) {
        final val = DogoSubBreedList(
          subBreeds: $checkedConvert('sub_breeds',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'subBreeds': 'sub_breeds'},
    );

Map<String, dynamic> _$DogoSubBreedListToJson(DogoSubBreedList instance) =>
    <String, dynamic>{
      'sub_breeds': instance.subBreeds,
      'status': instance.status,
    };
