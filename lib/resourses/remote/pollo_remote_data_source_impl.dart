import 'dart:convert';

import 'package:pollo_education/models/banner_model.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/study_material_model.dart';
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
    final uri =
        makeUri('/api/GetVideoListByCourseIdAndChapter/$courseId/$chapter');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => VideoModel.fromJson(e)).toList();
  }

  @override
  Future<List<VideoModel>> getVideoListByCourseIdChapterAndSubject(
    String courseId,
    String chapter,
    String subjectName,
  ) async {
    final uri = makeUri(
        '/api/GetVideoListByCourseIdAndChapterAndSubject/$courseId/$chapter/$subjectName');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => VideoModel.fromJson(e)).toList();
  }

  @override
  Future<List<StudyMaterialModel>> getMaterialListByCourseId(
    String courseId,
  ) async {
    final uri = makeUri('/api/GetMaterialListByCourseId/$courseId');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => StudyMaterialModel.fromJson(e)).toList();
  }

  @override
  Future<List<StudyMaterialModel>> getMaterialListByCourseIdAndChapter(
    String courseId,
    String chapter,
  ) async {
    final uri =
        makeUri('/api/GetMaterialListByCourseIdAndChapter/$courseId/$chapter');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => StudyMaterialModel.fromJson(e)).toList();
  }

  @override
  Future<List<StudyMaterialModel>> getMaterialListByCourseIdChapterAndSubject(
    String courseId,
    String chapter,
    String subjectName,
  ) async {
    final uri = makeUri(
        '/api/GetMaterialListByCourseIdAndChapterAndSubject/$courseId/$chapter/$subjectName');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => StudyMaterialModel.fromJson(e)).toList();
  }

  @override
  Future<List<BannerModel>> getBottomBanners() async {
    final uri = makeUri('/api/GetBottomBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromJson(e)).toList();
  }

  @override
  Future<List<BannerModel>> getMainBanners() async {
    final uri = makeUri('/api/GetHomePageMainBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromJson(e)).toList();
  }

  @override
  Future<List<BannerModel>> getMiddleFirstBanners() async {
    final uri = makeUri('/api/GetMiddleFirstBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromJson(e)).toList();
  }

  @override
  Future<List<BannerModel>> getSecondBanners() async {
    final uri = makeUri('/api/GetMiddleSecondBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromJson(e)).toList();
  }

  @override
  Future<List<BannerModel>> getThirdBanners() async {
    final uri = makeUri('/api/GetMiddleThirdBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromJson(e)).toList();
  }
}
