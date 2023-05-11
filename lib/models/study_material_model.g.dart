// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_material_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyMaterialModel _$StudyMaterialModelFromJson(Map<String, dynamic> json) =>
    StudyMaterialModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      subject: SubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
      board: BoardModel.fromJson(json['board'] as Map<String, dynamic>),
      classId: json['class'] as String,
      state: StateModel.fromJson(json['state'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$StudyMaterialModelToJson(StudyMaterialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'subject': instance.subject,
      'board': instance.board,
      'class': instance.classId,
      'state': instance.state,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
