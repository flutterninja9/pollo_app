class ScholarshipModel {
  String? id;
  String? name;
  String? totalQuestion;
  String? duration;
  String? marks;
  String? examId;
  String? date;
  String? status;
  String? image;
  String? examDate;
  String? description;
  String? fees;

  ScholarshipModel(
      {this.id,
      this.name,
      this.totalQuestion,
      this.duration,
      this.marks,
      this.examId,
      this.date,
      this.status,
      this.image,
      this.examDate,
      this.description,
      this.fees});

  ScholarshipModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalQuestion = json['total_question'];
    duration = json['duration'];
    marks = json['marks'];
    examId = json['exam_id'];
    date = json['date'];
    status = json['status'];
    image = json['image'];
    examDate = json['exam_date'];
    description = json['description'];
    fees = json['fees'] ?? "0";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['total_question'] = totalQuestion;
    data['duration'] = duration;
    data['marks'] = marks;
    data['exam_id'] = examId;
    data['date'] = date;
    data['status'] = status;
    data['image'] = image;
    data['exam_date'] = examDate;
    data['description'] = description;
    data['fees'] = fees;
    return data;
  }
}
