import 'package:json_annotation/json_annotation.dart';

part 'scholarship_info.g.dart';

@JsonSerializable() 
class ScholarshipInfo {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'total_question')
  final String totalQuestions;
  @JsonKey(name: 'duration')
  final String duration;
  @JsonKey(name: 'marks')
  final String marks;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'exam_id')
  final String examId;
  @JsonKey(name: 'date')
  final String date;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'exam_date')
  final String examDate;

  ScholarshipInfo({
    required this.id,
    required this.name,
    required this.totalQuestions,
    required this.duration,
    required this.marks,
    required this.description,
    required this.examId,
    required this.date,
    required this.status,
    required this.examDate,
  });

  factory ScholarshipInfo.fromJson(Map<String, dynamic> json) =>
      _$ScholarshipInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ScholarshipInfoToJson(this);
}
