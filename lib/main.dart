import 'package:flutter/material.dart';
import 'package:for_inherited_widget_practice/Screen/home_screen.dart';
import 'package:for_inherited_widget_practice/indicator_inherited.dart';
import 'package:for_inherited_widget_practice/overlay_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // InheritedWidgetはInheritedWidgetを使用するWidgetの親Widgetである必要があるため、今回はMaterialAppの上に定義
    return IndicatorInherited(
      indicatorNotifier: IndicatorNotifier(),
      child: MaterialApp(
        // MaterialAppのbuilderを使うことでNavigatorよりも上の層にWidgetを配置することができる
        builder: (context, child) {
          final indicatorNotifier =
              IndicatorInherited.of(context, listen: true)!.indicatorNotifier;
          return Stack(
            children: [
              if (child != null) child,
              OverlayIndicator(
                indicatorNotifier: indicatorNotifier,
              ), // Navigatorよりも上にインジケータのウィジェットを配置
            ],
          );
        },
        home: const HomeScreen(),
      ),
    );
  }
}
