class ScholarshipInfo {
  final String name;
  final String description;
  final String image;
  final String link;

  ScholarshipInfo({
    required this.name,
    required this.description,
    required this.image,
    required this.link,
  });

  factory ScholarshipInfo.fromJson(Map<String, dynamic> json) {
    return ScholarshipInfo(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      link: json['link'],
    );
  }

  @override
  String toString() {
    return 'ScholarshipInfo(name: $name, description: $description, image: $image, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScholarshipInfo &&
        other.name == name &&
        other.description == description &&
        other.image == image &&
        other.link == link;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        image.hashCode ^
        link.hashCode;
  }
}
