import 'package:dartz/dartz.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/models/video_model.dart';

abstract class IPolloAppRepository {
  Future<Either<Error, List<StateModel>>> getStateList();
  Future<Either<Error, List<BoardModel>>> getBoardListByStateName(
      String stateName);
  Future<Either<Error, List<ClassModel>>> getClassListByBoardName(
      String boardName);
  Future<Either<Error, List<SubjectModel>>> getSubjectListByCourseId(
      String courseId);
  Future<Either<Error, List<VideoModel>>> getVideoListByCourseId(
      String courseId);
  Future<Either<Error, List<VideoModel>>> getVideoListByCourseIdAndChapter(
    String courseId,
    String chapter,
  );
  // Future<Either<Error, List<VideoModel>>>
  //     getVideoListByCourseIdChapterAndSubject(
  //         int courseId, String chapter, String subjectName);
  // Future<Either<Error, List<StudyMaterialModel>>> getMaterialListByCourseId(
  //     int courseId);
  // Future<Either<Error, List<StudyMaterialModel>>>
  //     getMaterialListByCourseIdAndChapter(int courseId, String chapter);
  // Future<Either<Error, List<StudyMaterialModel>>>
  //     getMaterialListByCourseIdChapterAndSubject(
  //         int courseId, String chapter, String subjectName);
}
