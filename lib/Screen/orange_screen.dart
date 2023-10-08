import 'package:flutter/material.dart';
import 'package:for_inherited_widget_practice/Screen/green_screen.dart';
import 'package:for_inherited_widget_practice/indicator_inherited.dart';

class OrangeScreen extends StatelessWidget {
  const OrangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrangeScreen'),
        backgroundColor: Colors.orange.shade600,
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
                  backgroundColor: Colors.orange.shade600,
                ),
                child: const Text('startLoading'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const GreenScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                ),
                child: const Text('GreenScreenへ'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.orange.shade300,
    );
  }
}
