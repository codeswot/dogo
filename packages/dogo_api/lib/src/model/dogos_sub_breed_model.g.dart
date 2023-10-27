// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'dogos_sub_breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogosSubBreedModel _$DogosSubBreedModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DogosSubBreedModel',
      json,
      ($checkedConvert) {
        final val = DogosSubBreedModel(
          message: $checkedConvert('message',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          status: $checkedConvert('status', (v) => v as String),
        );
        return val;
      },
    );
