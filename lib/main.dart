import 'package:flutter/material.dart';
import 'package:for_inherited_widget_practice/Screen/home_screen.dart';
import 'package:for_inherited_widget_practice/overlay_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OverlayIndicator(
        child: HomeScreen(),
      ),
    );
  }
}
