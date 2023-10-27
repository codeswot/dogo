// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'dogos_breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogosBreedModel _$DogosBreedModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DogosBreedModel',
      json,
      ($checkedConvert) {
        final val = DogosBreedModel(
          message: $checkedConvert(
              'message',
              (v) => (v as Map<String, dynamic>).map(
                    (k, e) => MapEntry(k,
                        (e as List<dynamic>).map((e) => e as String).toList()),
                  )),
          status: $checkedConvert('status', (v) => v as String),
        );
        return val;
      },
    );
