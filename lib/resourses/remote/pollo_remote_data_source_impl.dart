import 'dart:convert';
import 'package:pollo_education/models/banner_model.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/computer_course_model.dart';
import 'package:pollo_education/models/scholarship_class_model.dart';
import 'package:pollo_education/models/scholarship_fee_and_date_model.dart';
import 'package:pollo_education/models/scholarship_info.dart';
import 'package:pollo_education/models/scholarship_level_and_class_model.dart';
import 'package:pollo_education/models/scholarship_model.dart';
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
    final uri = makeUri('/api/GetEveryThingByCourseId/$courseId');
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
    return data.map((e) => BannerModel.fromMap(e)).toList();
  }

  @override
  Future<List<BannerModel>> getMainBanners() async {
    final uri = makeUri('/api/GetHomePageMainBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromMap(e)).toList();
  }

  @override
  Future<List<BannerModel>> getMiddleFirstBanners() async {
    final uri = makeUri('/api/GetMiddleFirstBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromMap(e)).toList();
  }

  @override
  Future<List<BannerModel>> getSecondBanners() async {
    final uri = makeUri('/api/GetMiddleSecondBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromMap(e)).toList();
  }

  @override
  Future<List<BannerModel>> getThirdBanners() async {
    final uri = makeUri('/api/GetMiddleThirdBanner');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => BannerModel.fromMap(e)).toList();
  }

  @override
  Future<List<ScholarshipClassModel>> getClassesByLevel(String level) async {
    final uri = makeUri('/api/GetClassNameByLevelName/$level');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => ScholarshipClassModel.fromJson(e)).toList();
  }

  @override
  Future<List<ClassModel>> getQuestionsWithClassAndExam(
      String className, String examId) async {
    final uri =
        makeUri('/api/GetQuestionListByClassNameAndExamid/$examId/$className');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => ClassModel.fromJson(e)).toList();
  }

  @override
  Future<ScholarshipFeeAndDateModel> getScholarshipFeeAndDateByExamId(
      String examId) async {
    final uri = makeUri('/api/GetExamfeesAndExamDate/$examId');
    final response = await apiClient.get(uri);
    return ScholarshipFeeAndDateModel.fromJson(
        jsonDecode(response.body)['data']);
  }

  @override
  Future<ScholarshipInfo> getScholarshipInfoByExamId(String examId) async {
    final uri = makeUri('/api/GetScholarshipInfo/$examId');
    final response = await apiClient.get(uri);
    return ScholarshipInfo.fromJson(jsonDecode(response.body)['data']);
  }

  @override
  Future<List<ScholarshipLevelAndClassModel>>
      getScholarshipLevelAndClass() async {
    final uri = makeUri('/api/GetLevelandClassofScholarshipList');
    final response = await apiClient.get(uri);
    return (jsonDecode(response.body)['data'] as List)
        .map((e) => ScholarshipLevelAndClassModel.fromMap(e))
        .toList();
  }

  @override
  Future<List<ScholarshipModel>> getScholarshipList() async {
    final uri = makeUri('/api/GetScholarshipList');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => ScholarshipModel.fromJson(e)).toList();
  }

  @override
  Future<List<ScholarshipModel>> getScholarshipListByExamId(
      String examId) async {
    final uri = makeUri('/api/GetScholarshipForList/$examId');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => ScholarshipModel.fromJson(e)).toList();
  }

  @override
  Future<List<ScholarshipModel>> getScholarshipsByClass(
      String className) async {
    final uri = makeUri('/api/GetScholarshipListByClassName/$className');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => ScholarshipModel.fromJson(e)).toList();
  }

  @override
  Future<List<ComputerCourseModel>> getComputerCourseList() async {
    final uri = makeUri('/api/GetComputerCourseList');
    final response = await apiClient.get(uri);
    final data = jsonDecode(response.body)['data'] as List;
    return data.map((e) => ComputerCourseModel.fromJson(e)).toList();
  }
}
