import 'package:flutter/foundation.dart';

class AppActions {
  final String label;
  final Function() onTapSeeAll;
  final List<AppAction> appActions;

  AppActions({
    required this.label,
    required this.onTapSeeAll,
    required this.appActions,
  });

  @override
  String toString() =>
      'AppActions(label: $label, onTapSeeAll: $onTapSeeAll, appActions: $appActions)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppActions &&
        other.label == label &&
        other.onTapSeeAll == onTapSeeAll &&
        listEquals(other.appActions, appActions);
  }

  @override
  int get hashCode =>
      label.hashCode ^ onTapSeeAll.hashCode ^ appActions.hashCode;
}

class AppAction {
  final String label;
  final String imagePath;
  final String routeName;
  final bool enabled;

  AppAction({
    required this.label,
    required this.imagePath,
    required this.routeName,
    required this.enabled,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppAction &&
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
    return 'AppAction(label: $label, imagePath: $imagePath, routeName: $routeName, enabled: $enabled)';
  }
}
