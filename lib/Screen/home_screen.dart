import 'package:flutter/material.dart';
import 'package:for_inherited_widget_practice/Screen/orange_screen.dart';
import 'package:for_inherited_widget_practice/indicator_inherited.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
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
                child: const Text('startLoading'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const OrangeScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600,
                ),
                child: const Text('OrangeScreen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
