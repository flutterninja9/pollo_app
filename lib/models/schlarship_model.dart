class ScholarshipModel {
  final String title;
  final String description;
  final String image;
  final String link;

  ScholarshipModel({
    required this.title,
    required this.description,
    required this.image,
    required this.link,
  });

  factory ScholarshipModel.fromJson(Map<String, dynamic> json) {
    return ScholarshipModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      link: json['link'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ScholarshipModel &&
      other.title == title &&
      other.description == description &&
      other.image == image &&
      other.link == link;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      link.hashCode;
  }

  @override
  String toString() {
    return 'ScholarshipModel(title: $title, description: $description, image: $image, link: $link)';
  }
}
