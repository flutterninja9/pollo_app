// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      subject: json['subject'] as String?,
      chapter: json['chapter'] as String,
      date: json['date'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      ytLink: json['link'] as String,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'chapter': instance.chapter,
      'date': instance.date,
      'title': instance.title,
      'description': instance.description,
      'subject': instance.subject,
      'link': instance.ytLink,
    };
