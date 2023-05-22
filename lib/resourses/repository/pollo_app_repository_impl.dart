// Concrete implementation of data repository
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pollo_education/models/banner_model.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/schlarship_model.dart';
import 'package:pollo_education/models/scholarship_fee_and_date_model.dart';
import 'package:pollo_education/models/scholarship_info.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/study_material_model.dart';
import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/models/video_model.dart';
import 'package:pollo_education/resourses/remote/i_pollo_remote_data_source.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';

class PolloRepositoryImpl implements IPolloAppRepository {
  final IPolloRemoteDataSource _polloRemoteDataSource;

  PolloRepositoryImpl(this._polloRemoteDataSource);
  @override
  Future<Either<Error, List<StateModel>>> getStateList() async {
    return _callbackHandler(_polloRemoteDataSource.getStateList);
  }

  @override
  Future<Either<Error, List<BoardModel>>> getBoardListByStateName(
      String stateName) {
    return _callbackHandler(
        () => _polloRemoteDataSource.getBoardListByStateName(stateName));
  }

  @override
  Future<Either<Error, List<ClassModel>>> getClassListByBoardName(
      String boardName) {
    return _callbackHandler(
        () => _polloRemoteDataSource.getClassListByBoardName(boardName));
  }

  @override
  Future<Either<Error, List<SubjectModel>>> getSubjectListByCourseId(
      String courseId) {
    return _callbackHandler(
        () => _polloRemoteDataSource.getSubjectListByCourseId(courseId));
  }

  @override
  Future<Either<Error, List<VideoModel>>> getVideoListByCourseId(
      String courseId) {
    return _callbackHandler(
        () => _polloRemoteDataSource.getVideoListByCourseId(courseId));
  }

  @override
  Future<Either<Error, List<VideoModel>>> getVideoListByCourseIdAndChapter(
      String courseId, String chapter) {
    return _callbackHandler(() => _polloRemoteDataSource
        .getVideoListByCourseIdAndChapter(courseId, chapter));
  }

  @override
  Future<Either<Error, List<VideoModel>>>
      getVideoListByCourseIdChapterAndSubject(
          String courseId, String chapter, String subjectName) {
    return _callbackHandler(() =>
        _polloRemoteDataSource.getVideoListByCourseIdChapterAndSubject(
            courseId, chapter, subjectName));
  }

  @override
  Future<Either<Error, List<StudyMaterialModel>>> getMaterialListByCourseId(
      String courseId) {
    return _callbackHandler(
        () => _polloRemoteDataSource.getMaterialListByCourseId(courseId));
  }

  @override
  Future<Either<Error, List<StudyMaterialModel>>>
      getMaterialListByCourseIdAndChapter(String courseId, String chapter) {
    return _callbackHandler(() => _polloRemoteDataSource
        .getMaterialListByCourseIdAndChapter(courseId, chapter));
  }

  @override
  Future<Either<Error, List<StudyMaterialModel>>>
      getMaterialListByCourseIdChapterAndSubject(
          String courseId, String chapter, String subjectName) {
    return _callbackHandler(() =>
        _polloRemoteDataSource.getMaterialListByCourseIdChapterAndSubject(
            courseId, chapter, subjectName));
  }

  Future<Either<Error, T>> _callbackHandler<T>(
      Future<T> Function() callback) async {
    try {
      return right(await callback());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, List<BannerModel>>> getBottomBanners() async {
    return _callbackHandler(() => _polloRemoteDataSource.getBottomBanners());
  }

  @override
  Future<Either<Error, List<BannerModel>>> getMainBanners() async {
    return _callbackHandler(() => _polloRemoteDataSource.getMainBanners());
  }

  @override
  Future<Either<Error, List<BannerModel>>> getMiddleFirstBanners() async {
    return _callbackHandler(
        () => _polloRemoteDataSource.getMiddleFirstBanners());
  }

  @override
  Future<Either<Error, List<BannerModel>>> getSecondBanners() async {
    return _callbackHandler(() => _polloRemoteDataSource.getSecondBanners());
  }

  @override
  Future<Either<Error, List<BannerModel>>> getThirdBanners() async {
    return _callbackHandler(() => _polloRemoteDataSource.getThirdBanners());
  }

  @override
  Future<Either<Error, List<ClassModel>>> getClassesByLevel(
      String level) async {
    return _callbackHandler(
        () => _polloRemoteDataSource.getClassesByLevel(level));
  }

  @override
  Future<Either<Error, List<ClassModel>>> getQuestionsWithClassAndExam(
      String className, String examId) async {
    return _callbackHandler(() =>
        _polloRemoteDataSource.getQuestionsWithClassAndExam(className, examId));
  }

  @override
  Future<Either<Error, ScholarshipFeeAndDateModel>>
      getScholarshipFeeAndDateByExamId(String examId) async {
    return _callbackHandler(
        () => _polloRemoteDataSource.getScholarshipFeeAndDateByExamId(examId));
  }

  @override
  Future<Either<Error, ScholarshipInfo>> getScholarshipInfoByExamId(
      String examId) async {
    return _callbackHandler(
        () => _polloRemoteDataSource.getScholarshipInfoByExamId(examId));
  }

  @override
  Future<Either<Error, String>> getScholarshipLevelAndClass() async {
    return _callbackHandler(
        () => _polloRemoteDataSource.getScholarshipLevelAndClass());
  }

  @override
  Future<Either<Error, List<ScholarshipModel>>> getScholarshipList() async {
    return _callbackHandler(() => _polloRemoteDataSource.getScholarshipList());
  }

  @override
  Future<Either<Error, List<ScholarshipModel>>> getScholarshipListByExamId(
      String examId) async {
    return _callbackHandler(
        () => _polloRemoteDataSource.getScholarshipListByExamId(examId));
  }
}
