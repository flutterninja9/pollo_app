// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassModel _$ClassModelFromJson(Map<String, dynamic> json) => ClassModel(
      id: json['id'] as String,
      classNAme: json['class_name'] as String,
      stateName: json['state'] as String,
      board: json['board'] as String,
      courseId: json['course_id'] as String,
      totalSubject: json['total_subject'] as String,
      subject: json['subject'] as String,
      chapter: json['chapter'] as String,
    );

Map<String, dynamic> _$ClassModelToJson(ClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'class_name': instance.classNAme,
      'state': instance.stateName,
      'board': instance.board,
      'course_id': instance.courseId,
      'total_subject': instance.totalSubject,
      'subject': instance.subject,
      'chapter': instance.chapter,
    };
