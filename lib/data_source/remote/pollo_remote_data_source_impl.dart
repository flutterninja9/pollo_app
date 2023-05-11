import 'package:dio/dio.dart';
import 'package:pollo_education/data_source/remote/i_pollo_remote_data_source.dart';

class PolloRemoteDataSourceImpl implements IPolloRemoteDataSource {
  final Dio dio;

  PolloRemoteDataSourceImpl(this.dio);
  @override
  Future<List<String>> getStateList() async {
    // Implement API call to https://domain.com/GetStateList
    final response = await dio.get('/GetStateList');
    return response.data;
  }

  @override
  Future<List<String>> getBoardListByStateName(String stateName) async {
    // Implement API call to https://domain.com/GetBoardListByStateName/{state_name}
    final response = await dio.get('/GetBoardListByStateName/$stateName');
    return response.data;
  }

  @override
  Future<List<String>> getClassListByBoardName(String boardName) async {
    // Implement API call to https://domain.com/GetClassListByBoardName/{board_name}
    final response = await dio.get('/GetClassListByBoardName/$boardName');
    return response.data;
  }

  @override
  Future<List<String>> getSubjectListByCourseId(int courseId) async {
    // Implement API call to https://domain.com/GetSubjectListByCourseId/{course_id}
    final response = await dio.get('/GetSubjectListByCourseId/$courseId');
    return response.data;
  }

  @override
  Future<List<String>> getVideoListByCourseId(int courseId) async {
    // Implement API call to https://domain.com/GetVideoListByCourseId/{course_id}
    final response = await dio.get('/GetVideoListByCourseId/$courseId');
    return response.data;
  }

  @override
  Future<List<String>> getVideoListByCourseIdAndChapter(int courseId, String chapter) async {
    // Implement API call to https://domain.com/GetVideoListByCourseIdAndChapter/{course_id}/{chapter}
    final response = await dio.get('/GetVideoListByCourseIdAndChapter/$courseId/$chapter');
    return response.data;
  }

  @override
  Future<List<String>> getVideoListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName) async {
    // Implement API call to https://domain.com/GetVideoListByCourseIdAndChapterAndSubject/{course_id}/{chapter}/{subject_name}
    final response = await dio.get('/GetVideoListByCourseIdAndChapterAndSubject/$courseId/$chapter/$subjectName');
    return response.data;
  }

  @override
  Future<List<String>> getMaterialListByCourseId(int courseId) async {
    // Implement API call to https://domain.com/GetMaterialListByCourseId/{course_id}
    final response = await dio.get('/GetMaterialListByCourseId/$courseId');
    return response.data;
  }

  @override
  Future<List<String>> getMaterialListByCourseIdAndChapter(int courseId, String chapter) async {
    // Implement API call to https://domain.com/GetMaterialListByCourseIdAndChapter/{course_id}/{chapter}
    final response = await dio.get('/GetMaterialListByCourseIdAndChapter/$courseId/$chapter');
    return response.data;
  }

  @override
  Future<List<String>> getMaterialListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName) async {
    // Implement API call to https://domain.com/GetMaterialListByCourseIdAndChapterAndSubject/{course_id}/{chapter}/{subject_name}
    final response = await dio.get('/GetMaterialListByCourseIdAndChapterAndSubject/$courseId/$chapter/$subjectName');
    return response.data;
  }
}
