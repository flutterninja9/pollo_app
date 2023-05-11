import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/data_source/remote/pollo_remote_data_source_impl.dart';
import 'package:pollo_education/utils/core_providers.dart';

final remoteDatasourceProvider = Provider<IPolloRemoteDataSource>((ref) {
  return PolloRemoteDataSourceImpl(ref.read(dioProvider));
});

abstract class IPolloRemoteDataSource {
  Future<List<String>> getStateList();
  Future<List<String>> getBoardListByStateName(String stateName);
  Future<List<String>> getClassListByBoardName(String boardName);
  Future<List<String>> getSubjectListByCourseId(int courseId);
  Future<List<String>> getVideoListByCourseId(int courseId);
  Future<List<String>> getVideoListByCourseIdAndChapter(int courseId, String chapter);
  Future<List<String>> getVideoListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName);
  Future<List<String>> getMaterialListByCourseId(int courseId);
  Future<List<String>> getMaterialListByCourseIdAndChapter(int courseId, String chapter);
  Future<List<String>> getMaterialListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName);
}
