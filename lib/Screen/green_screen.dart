import 'package:flutter/material.dart';
import 'package:for_inherited_widget_practice/indicator_inherited.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GreenScreen'),
        backgroundColor: Colors.green.shade600,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  IndicatorInherited.of(context, listen: false)
                      ?.indicatorNotifier
                      .showIndicator();
                  Future.delayed(const Duration(seconds: 3), () {
                    IndicatorInherited.of(context, listen: false)
                        ?.indicatorNotifier
                        .hideIndicator();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                ),
                child: const Text('startLoading'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green.shade300,
    );
  }
}
