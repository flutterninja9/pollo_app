import 'dart:convert';

import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/models/video_model.dart';
import 'package:pollo_education/resourses/remote/i_pollo_remote_data_source.dart';
import 'package:pollo_education/utils/api_client/api_client.dart';
import 'package:pollo_education/utils/make_uri.dart';

class PolloRemoteDataSourceImpl implements IPolloRemoteDataSource {
  final ApiClient apiClient;

  PolloRemoteDataSourceImpl({required this.apiClient});
  @override
  Future<List<StateModel>> getStateList() async {
    final uri = makeUri('/api/GetStateList');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => StateModel.fromJson(e)).toList();
  }

  @override
  Future<List<BoardModel>> getBoardListByStateName(String stateName) async {
    final uri = makeUri('/api/GetBoardListByStateName/$stateName');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BoardModel.fromJson(e)).toList();
  }

  @override
  Future<List<ClassModel>> getClassListByBoardName(String boardName) async {
    final uri = makeUri('/api/GetClassListByBoardName/$boardName');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => ClassModel.fromJson(e)).toList();
  }

  @override
  Future<List<SubjectModel>> getSubjectListByCourseId(String courseId) async {
    final uri = makeUri('/api/GetSubjectListByCourseId/$courseId');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => SubjectModel.fromJson(e)).toList();
  }

  @override
  Future<List<VideoModel>> getVideoListByCourseId(String courseId) async {
    final uri = makeUri('/api/GetVideoListByCourseId/$courseId');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => VideoModel.fromJson(e)).toList();
  }

  @override
  Future<List<VideoModel>> getVideoListByCourseIdAndChapter(
    String courseId,
    String chapter,
  ) async {
    final uri = makeUri('/api/GetVideoListByCourseIdAndChapter/$courseId/$chapter');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => VideoModel.fromJson(e)).toList();
  }

  // @override
  // Future<List<VideoModel>> getVideoListByCourseIdChapterAndSubject(
  //     int courseId, String chapter, String subjectName) async {
  //   final response = await apiClient.get(
  //       '/GetVideoListByCourseIdAndChapterAndSubject/$courseId/$chapter/$subjectName');
  //   if (response.data != null) {
  //     return (response.data as List)
  //         .map((e) => VideoModel.fromJson(e))
  //         .toList();
  //   } else {
  //     throw Exception('No data received');
  //   }
  // }

  // @override
  // Future<List<StudyMaterialModel>> getMaterialListByCourseId(
  //     int courseId) async {
  //   final response = await apiClient.get('/GetMaterialListByCourseId/$courseId');
  //   if (response.data != null) {
  //     return (response.data as List)
  //         .map((e) => StudyMaterialModel.fromJson(e))
  //         .toList();
  //   } else {
  //     throw Exception('No data received');
  //   }
  // }

  // @override
  // Future<List<StudyMaterialModel>> getMaterialListByCourseIdAndChapter(
  //     int courseId, String chapter) async {
  //   final response = await apiClient
  //       .get('/GetMaterialListByCourseIdAndChapter/$courseId/$chapter');
  //   if (response.data != null) {
  //     return (response.data as List)
  //         .map((e) => StudyMaterialModel.fromJson(e))
  //         .toList();
  //   } else {
  //     throw Exception('No data received');
  //   }
  // }

  // @override
  // Future<List<StudyMaterialModel>> getMaterialListByCourseIdChapterAndSubject(
  //     int courseId, String chapter, String subjectName) async {
  //   final response = await apiClient.get(
  //       '/GetMaterialListByCourseIdAndChapterAndSubject/$courseId/$chapter/$subjectName');
  //   if (response.data != null) {
  //     return (response.data as List)
  //         .map((e) => StudyMaterialModel.fromJson(e))
  //         .toList();
  //   } else {
  //     throw Exception('No data received');
  //   }
  // }
}
