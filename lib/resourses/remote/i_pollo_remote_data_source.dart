import 'package:pollo_education/models/banner_model.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/study_material_model.dart';
import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/models/video_model.dart';

abstract class IPolloRemoteDataSource {
  Future<List<StateModel>> getStateList();
  Future<List<BoardModel>> getBoardListByStateName(String stateName);
  Future<List<ClassModel>> getClassListByBoardName(String boardName);
  Future<List<SubjectModel>> getSubjectListByCourseId(String courseId);
  Future<List<VideoModel>> getVideoListByCourseId(String courseId);
  Future<List<VideoModel>> getVideoListByCourseIdAndChapter(
    String courseId,
    String chapter,
  );
  Future<List<VideoModel>> getVideoListByCourseIdChapterAndSubject(
    String courseId,
    String chapter,
    String subjectName,
  );
  Future<List<StudyMaterialModel>> getMaterialListByCourseId(String courseId);
  Future<List<StudyMaterialModel>> getMaterialListByCourseIdAndChapter(
    String courseId,
    String chapter,
  );
  Future<List<StudyMaterialModel>> getMaterialListByCourseIdChapterAndSubject(
    String courseId,
    String chapter,
    String subjectName,
  );
  Future<List<BannerModel>> getMainBanners();
  Future<List<BannerModel>> getMiddleFirstBanners();
  Future<List<BannerModel>> getSecondBanners();
  Future<List<BannerModel>> getThirdBanners();
  Future<List<BannerModel>> getBottomBanners();
}
