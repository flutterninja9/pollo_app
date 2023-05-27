import 'dart:convert';

class ScholarshipLevelAndClassModel {
  final String id;
  final String name;
  final String date;
  final String level;
  
  ScholarshipLevelAndClassModel({
    required this.id,
    required this.name,
    required this.date,
    required this.level,
  });

  ScholarshipLevelAndClassModel copyWith({
    String? id,
    String? name,
    String? date,
    String? level,
  }) {
    return ScholarshipLevelAndClassModel(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'level': level,
    };
  }

  factory ScholarshipLevelAndClassModel.fromMap(Map<String, dynamic> map) {
    return ScholarshipLevelAndClassModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      date: map['date'] ?? '',
      level: map['level'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ScholarshipLevelAndClassModel.fromJson(String source) => ScholarshipLevelAndClassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ScholarshipLevelAndClassModel(id: $id, name: $name, date: $date, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ScholarshipLevelAndClassModel &&
      other.id == id &&
      other.name == name &&
      other.date == date &&
      other.level == level;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      date.hashCode ^
      level.hashCode;
  }
}
