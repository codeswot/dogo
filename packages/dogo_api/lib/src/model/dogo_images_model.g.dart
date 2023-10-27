// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'dogo_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogoImagesModel _$DogoImagesModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DogoImagesModel',
      json,
      ($checkedConvert) {
        final val = DogoImagesModel(
          message: $checkedConvert('message',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          status: $checkedConvert('status', (v) => v as String),
        );
        return val;
      },
    );
