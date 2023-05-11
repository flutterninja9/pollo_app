// Concrete implementation of data repository
import 'package:dartz/dartz.dart';
import 'package:pollo_education/data_source/remote/i_pollo_remote_data_source.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/study_material_model.dart';
import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/models/video_model.dart';
import 'package:pollo_education/repository/i_pollo_app_repository.dart';

class PolloRepositoryImpl implements IPolloAppRepository {
  final IPolloRemoteDataSource _polloRemoteDataSource;

  PolloRepositoryImpl(this._polloRemoteDataSource);
  @override
  Future<Either<Error, List<StateModel>>> getStateList() {
    return _callbackHandler(_polloRemoteDataSource.getStateList);
  }

  @override
  Future<Either<Error, List<BoardModel>>> getBoardListByStateName(String stateName) {
    return _callbackHandler(() => _polloRemoteDataSource.getBoardListByStateName(stateName));
  }

  @override
  Future<Either<Error, List<ClassModel>>> getClassListByBoardName(String boardName) {
    return _callbackHandler(() => _polloRemoteDataSource.getClassListByBoardName(boardName));
  }

  @override
  Future<Either<Error, List<SubjectModel>>> getSubjectListByCourseId(int courseId) {
    return _callbackHandler(() => _polloRemoteDataSource.getSubjectListByCourseId(courseId));
  }

  @override
  Future<Either<Error, List<VideoModel>>> getVideoListByCourseId(int courseId) {
    return _callbackHandler(() => _polloRemoteDataSource.getVideoListByCourseId(courseId));
  }

  @override
  Future<Either<Error, List<VideoModel>>> getVideoListByCourseIdAndChapter(int courseId, String chapter) {
    return _callbackHandler(() => _polloRemoteDataSource.getVideoListByCourseIdAndChapter(courseId, chapter));
  }

  @override
  Future<Either<Error, List<VideoModel>>> getVideoListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName) {
    return _callbackHandler(() => _polloRemoteDataSource.getVideoListByCourseIdChapterAndSubject(courseId, chapter, subjectName));
  }

  @override
  Future<Either<Error, List<StudyMaterialModel>>> getMaterialListByCourseId(int courseId) {
    return _callbackHandler(() => _polloRemoteDataSource.getMaterialListByCourseId(courseId));
  }

  @override
  Future<Either<Error, List<StudyMaterialModel>>> getMaterialListByCourseIdAndChapter(int courseId, String chapter) {
    return _callbackHandler(() => _polloRemoteDataSource.getMaterialListByCourseIdAndChapter(courseId, chapter));
  }

  @override
  Future<Either<Error, List<StudyMaterialModel>>> getMaterialListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName) {
    return _callbackHandler(() => _polloRemoteDataSource.getMaterialListByCourseIdChapterAndSubject(courseId, chapter, subjectName));
  }

  Future<Either<Error, T>> _callbackHandler<T>(Future<T> Function() callback) async {
    try {
      return right(await callback());
    }
    catch(e) {
      return Left(Error());
    }
  }
}
