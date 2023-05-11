import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/data_source/remote/i_pollo_remote_data_source.dart';
import 'package:pollo_education/repository/pollo_app_repository_impl.dart';

final repositoryProvider = Provider<IPolloAppRepository>((ref) {
  return PolloRepositoryImpl(ref.watch(remoteDatasourceProvider));
});

abstract class IPolloAppRepository {
  Future<Either<Error, List<String>>> getStateList();
  Future<Either<Error, List<String>>> getBoardListByStateName(String stateName);
  Future<Either<Error, List<String>>> getClassListByBoardName(String boardName);
  Future<Either<Error, List<String>>> getSubjectListByCourseId(int courseId);
  Future<Either<Error, List<String>>> getVideoListByCourseId(int courseId);
  Future<Either<Error, List<String>>> getVideoListByCourseIdAndChapter(int courseId, String chapter);
  Future<Either<Error, List<String>>> getVideoListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName);
  Future<Either<Error, List<String>>> getMaterialListByCourseId(int courseId);
  Future<Either<Error, List<String>>> getMaterialListByCourseIdAndChapter(int courseId, String chapter);
  Future<Either<Error, List<String>>> getMaterialListByCourseIdChapterAndSubject(int courseId, String chapter, String subjectName);
}
