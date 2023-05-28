import 'package:dartz/dartz.dart';
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
  Future<Either<Error, List<VideoModel>>>
      getVideoListByCourseIdChapterAndSubject(
    String courseId,
    String chapter,
    String subjectName,
  );
  Future<Either<Error, List<StudyMaterialModel>>> getMaterialListByCourseId(
    String courseId,
  );
  Future<Either<Error, List<StudyMaterialModel>>>
      getMaterialListByCourseIdAndChapter(
    String courseId,
    String chapter,
  );
  Future<Either<Error, List<StudyMaterialModel>>>
      getMaterialListByCourseIdChapterAndSubject(
    String courseId,
    String chapter,
    String subjectName,
  );
  Future<Either<Error, List<BannerModel>>> getMainBanners();
  Future<Either<Error, List<BannerModel>>> getMiddleFirstBanners();
  Future<Either<Error, List<BannerModel>>> getSecondBanners();
  Future<Either<Error, List<BannerModel>>> getThirdBanners();
  Future<Either<Error, List<BannerModel>>> getBottomBanners();
  Future<Either<Error, List<ScholarshipModel>>> getScholarshipList();
  Future<Either<Error, ScholarshipInfo>> getScholarshipInfoByExamId(String examId);
  Future<Either<Error, List<ScholarshipModel>>> getScholarshipListByExamId(
      String examId);
  Future<Either<Error, List<ScholarshipLevelAndClassModel>>> getScholarshipLevelAndClass();
  Future<Either<Error, List<ScholarshipModel>>> getScholarshipsByClass(String className);
  Future<Either<Error, List<ScholarshipClassModel>>> getClassesByLevel(String level);
  Future<Either<Error, List<ClassModel>>> getQuestionsWithClassAndExam(
      String className, String examId);
  Future<Either<Error, ScholarshipFeeAndDateModel>>
      getScholarshipFeeAndDateByExamId(String examId);

  Future<Either<Error, List<ComputerCourseModel>>> getComputerCourseList();
}
