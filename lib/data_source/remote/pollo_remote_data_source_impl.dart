import 'package:dio/dio.dart';
import 'package:pollo_education/data_source/remote/i_pollo_remote_data_source.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/study_material_model.dart';
import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/models/video_model.dart';

class PolloRemoteDataSourceImpl implements IPolloRemoteDataSource {
  final Dio dio;

  PolloRemoteDataSourceImpl(this.dio);
  @override
  Future<List<StateModel>> getStateList() async {
    final response = await dio.get('/GetStateList');
    if(response.data != null) {
      return (response.data as List).map((e) => StateModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<BoardModel>> getBoardListByStateName(String stateName) async {
    final response = await dio.get('/GetBoardListByStateName/$stateName');
    if(response.data != null) {
      return (response.data as List).map((e) => BoardModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<ClassModel>> getClassListByBoardName(String boardName) async {
    final response = await dio.get('/GetClassListByBoardName/$boardName');
    if(response.data != null) {
      return (response.data as List).map((e) => ClassModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<SubjectModel>> getSubjectListByCourseId(int courseId) async {
    final response = await dio.get('/GetSubjectListByCourseId/$courseId');
    if(response.data != null) {
      return (response.data as List).map((e) => SubjectModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<VideoModel>> getVideoListByCourseId(int courseId) async {
    final response = await dio.get('/GetVideoListByCourseId/$courseId');
    if(response.data != null) {
      return (response.data as List).map((e) => VideoModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<VideoModel>> getVideoListByCourseIdAndChapter(int courseId, String chapter) async {
    final response = await dio.get('/GetVideoListByCourseIdAndChapter/$courseId/$chapter');
    if(response.data != null) {
      return (response.data as List).map((e) => VideoModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<VideoModel>> getVideoListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName) async {
    final response = await dio.get('/GetVideoListByCourseIdAndChapterAndSubject/$courseId/$chapter/$subjectName');
    if(response.data != null) {
      return (response.data as List).map((e) => VideoModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<StudyMaterialModel>> getMaterialListByCourseId(int courseId) async {
    final response = await dio.get('/GetMaterialListByCourseId/$courseId');
    if(response.data != null) {
      return (response.data as List).map((e) => StudyMaterialModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<StudyMaterialModel>> getMaterialListByCourseIdAndChapter(int courseId, String chapter) async {
    final response = await dio.get('/GetMaterialListByCourseIdAndChapter/$courseId/$chapter');
    if(response.data != null) {
      return (response.data as List).map((e) => StudyMaterialModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }

  @override
  Future<List<StudyMaterialModel>> getMaterialListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName) async {
    final response = await dio.get('/GetMaterialListByCourseIdAndChapterAndSubject/$courseId/$chapter/$subjectName');
    if(response.data != null) {
      return (response.data as List).map((e) => StudyMaterialModel.fromJson(e)).toList();
    } else {
      throw Exception('No data received');
    }
  }
}
