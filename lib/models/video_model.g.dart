// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      thumbnail: json['thumbnail'] as String,
      board: BoardModel.fromJson(json['board'] as Map<String, dynamic>),
      subject: SubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
      classModel: ClassModel.fromJson(json['class'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'board': instance.board,
      'subject': instance.subject,
      'class': instance.classModel,
    };
