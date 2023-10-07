import 'package:flutter/material.dart';
import 'package:for_inherited_widget_practice/indicator_inherited.dart';

class OverlayIndicator extends StatefulWidget {
  const OverlayIndicator({super.key, required this.indicatorNotifier});

  final IndicatorNotifier indicatorNotifier;

  @override
  State<OverlayIndicator> createState() => _OverlayIndicatorState();
}

class _OverlayIndicatorState extends State<OverlayIndicator> {
  @override
  void initState() {
    super.initState();
    widget.indicatorNotifier.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.indicatorNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.indicatorNotifier.isLoading,
      child: const ColoredBox(
        color: Colors.black26,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
