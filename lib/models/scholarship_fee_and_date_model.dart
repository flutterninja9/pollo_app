import 'dart:convert';

class ScholarshipFeeAndDateModel {
  final String scholarshipFee;
  final String scholarshipDate;
  ScholarshipFeeAndDateModel({
    required this.scholarshipFee,
    required this.scholarshipDate,
  });

  ScholarshipFeeAndDateModel copyWith({
    String? scholarshipFee,
    String? scholarshipDate,
  }) {
    return ScholarshipFeeAndDateModel(
      scholarshipFee: scholarshipFee ?? this.scholarshipFee,
      scholarshipDate: scholarshipDate ?? this.scholarshipDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'scholarship_fee': scholarshipFee,
      'scholarship_date': scholarshipDate,
    };
  }

  factory ScholarshipFeeAndDateModel.fromMap(Map<String, dynamic> map) {
    return ScholarshipFeeAndDateModel(
      scholarshipFee: map['scholarship_fee'] ?? '',
      scholarshipDate: map['scholarship_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ScholarshipFeeAndDateModel.fromJson(String source) =>
      ScholarshipFeeAndDateModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ScholarshipFeeAndDateModel(scholarshipFee: $scholarshipFee, scholarshipDate: $scholarshipDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScholarshipFeeAndDateModel &&
        other.scholarshipFee == scholarshipFee &&
        other.scholarshipDate == scholarshipDate;
  }

  @override
  int get hashCode => scholarshipFee.hashCode ^ scholarshipDate.hashCode;
}
