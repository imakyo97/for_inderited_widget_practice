import 'package:flutter/material.dart';
import 'package:for_inherited_widget_practice/indicator_inherited.dart';

class OverlayIndicator extends StatefulWidget {
  const OverlayIndicator({super.key});
  @override
  State<OverlayIndicator> createState() => _OverlayIndicatorState();
}

class _OverlayIndicatorState extends State<OverlayIndicator> {
  @override
  Widget build(BuildContext context) {
    final indicatorNotifier =
        IndicatorInherited.of(context, listen: true)!.indicatorNotifier;
    return ListenableBuilder(
      listenable: indicatorNotifier,
      builder: ((context, child) {
        return Visibility(
          visible: indicatorNotifier.isLoading,
          child: const ColoredBox(
            color: Colors.black26,
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      }),
    );
  }
}
