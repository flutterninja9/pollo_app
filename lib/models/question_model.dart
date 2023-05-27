import 'package:flutter/foundation.dart';

class QuestionModel {
  final String question;
  final String answer;
  final List<String> options;

  QuestionModel({
    required this.question,
    required this.answer,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      answer: json['answer'],
      options: (json['options'] as List).map((e) => e.toString()).toList(),
    );
  }

  @override
  String toString() =>
      'QuestionModel(question: $question, answer: $answer, options: $options)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.question == question &&
        other.answer == answer &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode => question.hashCode ^ answer.hashCode ^ options.hashCode;
}
