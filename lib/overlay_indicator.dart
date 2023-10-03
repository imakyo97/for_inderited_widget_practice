import 'package:flutter/material.dart';

class OverlayIndicator extends StatefulWidget {
  const OverlayIndicator({super.key, required this.child});
  final Widget child;
  @override
  State<OverlayIndicator> createState() => _OverlayIndicatorState();
}

class _OverlayIndicatorState extends State<OverlayIndicator> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Visibility(
          visible: isLoading,
          child: const ColoredBox(
            color: Colors.black26,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
