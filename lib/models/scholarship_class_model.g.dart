// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scholarship_class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScholarshipClassModel _$ScholarshipClassModelFromJson(
        Map<String, dynamic> json) =>
    ScholarshipClassModel(
      json['date'] as String,
      json['level'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ScholarshipClassModelToJson(
        ScholarshipClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'level': instance.level,
    };
