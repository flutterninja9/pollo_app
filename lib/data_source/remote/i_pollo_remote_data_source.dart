import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/data_source/remote/pollo_remote_data_source_impl.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/study_material_model.dart';
import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/models/video_model.dart';
import 'package:pollo_education/utils/core_providers.dart';

final remoteDatasourceProvider = Provider<IPolloRemoteDataSource>((ref) {
  return PolloRemoteDataSourceImpl(ref.read(dioProvider));
});

abstract class IPolloRemoteDataSource {
  Future<List<StateModel>> getStateList();
  Future<List<BoardModel>> getBoardListByStateName(String stateName);
  Future<List<ClassModel>> getClassListByBoardName(String boardName);
  Future<List<SubjectModel>> getSubjectListByCourseId(int courseId);
  Future<List<VideoModel>> getVideoListByCourseId(int courseId);
  Future<List<VideoModel>> getVideoListByCourseIdAndChapter(int courseId, String chapter);
  Future<List<VideoModel>> getVideoListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName);
  Future<List<StudyMaterialModel>> getMaterialListByCourseId(int courseId);
  Future<List<StudyMaterialModel>> getMaterialListByCourseIdAndChapter(int courseId, String chapter);
  Future<List<StudyMaterialModel>> getMaterialListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName);
}
