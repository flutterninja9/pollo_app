class AppOption {
  final String label;
  final String imagePath;
  final String routeName;
  final bool enabled;

  AppOption({
    required this.label,
    required this.imagePath,
    required this.routeName,
    required this.enabled,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppOption &&
        other.label == label &&
        other.imagePath == imagePath &&
        other.routeName == routeName &&
        other.enabled == enabled;
  }

  @override
  int get hashCode {
    return label.hashCode ^
        imagePath.hashCode ^
        routeName.hashCode ^
        enabled.hashCode;
  }

  @override
  String toString() {
    return 'AppOption(label: $label, imagePath: $imagePath, routeName: $routeName, enabled: $enabled)';
  }
}
