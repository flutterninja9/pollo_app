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
  Future<List<ScholarshipModel>> getScholarshipList();
  Future<ScholarshipInfo> getScholarshipInfoByExamId(String examId);
  Future<List<ScholarshipModel>> getScholarshipListByExamId(String examId);
  Future<List<ScholarshipLevelAndClassModel>> getScholarshipLevelAndClass();
  Future<List<ScholarshipClassModel>> getClassesByLevel(String level);
  Future<List<ClassModel>> getQuestionsWithClassAndExam(
      String className, String examId);
  Future<ScholarshipFeeAndDateModel> getScholarshipFeeAndDateByExamId(
      String examId);

  Future<List<ScholarshipModel>> getScholarshipsByClass(String className);

  Future<List<ComputerCourseModel>> getComputerCourseList();
}
