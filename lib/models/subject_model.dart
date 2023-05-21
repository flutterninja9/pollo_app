class SubjectModel {
  String? subjectName;
  String? totalChapter;
  List<Chapter>? chapter;

  SubjectModel({this.subjectName, this.totalChapter, this.chapter});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    subjectName = json['subject_name'];
    totalChapter = json['total_chapter'];
    if (json['chapter'] != null) {
      chapter = <Chapter>[];
      json['chapter'].forEach((v) {
        chapter!.add(new Chapter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_name'] = this.subjectName;
    data['total_chapter'] = this.totalChapter;
    if (this.chapter != null) {
      data['chapter'] = this.chapter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chapter {
  String? title;
  String? description;
  String? chapter;
  String? link;

  Chapter({this.title, this.description, this.chapter, this.link});

  Chapter.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    chapter = json['chapter'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['chapter'] = this.chapter;
    data['link'] = this.link;
    return data;
  }
}
