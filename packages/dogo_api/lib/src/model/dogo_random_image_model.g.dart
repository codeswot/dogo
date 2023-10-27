// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'dogo_random_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogoRandomImageModel _$DogoRandomImageModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DogoRandomImageModel',
      json,
      ($checkedConvert) {
        final val = DogoRandomImageModel(
          message: $checkedConvert('message', (v) => v as String),
          status: $checkedConvert('status', (v) => v as String),
        );
        return val;
      },
    );
