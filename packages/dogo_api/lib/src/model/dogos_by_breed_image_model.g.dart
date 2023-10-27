// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'dogos_by_breed_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogosByBreedImageModel _$DogosByBreedImageModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DogosByBreedImageModel',
      json,
      ($checkedConvert) {
        final val = DogosByBreedImageModel(
          message: $checkedConvert('message',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          status: $checkedConvert('status', (v) => v as String),
        );
        return val;
      },
    );
