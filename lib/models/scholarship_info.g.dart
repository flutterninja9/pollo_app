// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scholarship_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScholarshipInfo _$ScholarshipInfoFromJson(Map<String, dynamic> json) =>
    ScholarshipInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      totalQuestions: json['total_question'] as String,
      duration: json['duration'] as String,
      marks: json['marks'] as String,
      description: json['description'] as String,
      examId: json['exam_id'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
      examDate: json['exam_date'] as String,
    );

Map<String, dynamic> _$ScholarshipInfoToJson(ScholarshipInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'total_question': instance.totalQuestions,
      'duration': instance.duration,
      'marks': instance.marks,
      'description': instance.description,
      'exam_id': instance.examId,
      'date': instance.date,
      'status': instance.status,
      'exam_date': instance.examDate,
    };
