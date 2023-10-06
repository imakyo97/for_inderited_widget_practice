import 'package:flutter/material.dart';

class IndicatorInherited extends InheritedWidget {
  const IndicatorInherited({
    super.key,
    required super.child,
    required this.indicatorNotifier,
  });

  final IndicatorNotifier indicatorNotifier;

  static IndicatorInherited? of(BuildContext context, {required bool listen}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<IndicatorInherited>()
        : context
            .getElementForInheritedWidgetOfExactType<IndicatorInherited>()
            ?.widget as IndicatorInherited;
  }

  @override
  bool updateShouldNotify(IndicatorInherited oldWidget) {
    return indicatorNotifier != oldWidget.indicatorNotifier;
  }
}

class IndicatorNotifier with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void showIndicator() {
    _isLoading = true;
    notifyListeners();
  }

  void hideIndicator() {
    _isLoading = false;
    notifyListeners();
  }
}
