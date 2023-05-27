// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BannerModel {
  final String id;
  final String image;
  final String location;
  final String? caption;
  final String category;

  BannerModel({
    required this.id,
    required this.image,
    required this.location,
    this.caption,
    required this.category,
  });

  @override
  String toString() {
    return 'BannerModel(id: $id, image: $image, location: $location, caption: $caption, category: $category)';
  }

  @override
  bool operator ==(covariant BannerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.location == location &&
        other.caption == caption &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        location.hashCode ^
        caption.hashCode ^
        category.hashCode;
  }

  BannerModel copyWith({
    String? id,
    String? image,
    String? location,
    String? caption,
    String? category,
  }) {
    return BannerModel(
      id: id ?? this.id,
      image: image ?? this.image,
      location: location ?? this.location,
      caption: caption ?? this.caption,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'location': location,
      'caption': caption,
      'category': category,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      caption: map['caption'] != null ? map['caption'] as String : null,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
