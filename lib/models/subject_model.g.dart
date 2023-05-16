// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) => SubjectModel(
      id: json['id'] as String,
      name: json['subject_name'] as String,
      courseId: json['course_id'] as String,
      totalChapters: json['total_chapter'] as String,
    );

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_name': instance.name,
      'total_chapter': instance.totalChapters,
      'course_id': instance.courseId,
    };
