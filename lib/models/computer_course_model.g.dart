// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComputerCourseModel _$ComputerCourseModelFromJson(Map<String, dynamic> json) =>
    ComputerCourseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      date: json['date'] as String,
      courseId: json['course_id'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ComputerCourseModelToJson(
        ComputerCourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'date': instance.date,
      'course_id': instance.courseId,
      'description': instance.description,
    };
