import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/state_model.dart';

abstract class IPolloRemoteDataSource {
  Future<List<StateModel>> getStateList();
  Future<List<BoardModel>> getBoardListByStateName(String stateName);
  Future<List<ClassModel>> getClassListByBoardName(String boardName);
  // Future<List<SubjectModel>> getSubjectListByCourseId(int courseId);
  // Future<List<VideoModel>> getVideoListByCourseId(int courseId);
  // Future<List<VideoModel>> getVideoListByCourseIdAndChapter(
  //     int courseId, String chapter);
  // Future<List<VideoModel>> getVideoListByCourseIdChapterAndSubject(
  //     int courseId, String chapter, String subjectName);
  // Future<List<StudyMaterialModel>> getMaterialListByCourseId(int courseId);
  // Future<List<StudyMaterialModel>> getMaterialListByCourseIdAndChapter(
  //     int courseId, String chapter);
  // Future<List<StudyMaterialModel>> getMaterialListByCourseIdChapterAndSubject(
  //     int courseId, String chapter, String subjectName);
}
