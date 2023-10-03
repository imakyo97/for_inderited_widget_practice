import 'package:flutter/material.dart';

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
                  // TODO: ローディング開始処理を実装
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                ),
                child: const Text('startLoading'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: ローディング停止処理を実装
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                ),
                child: const Text('stopLoading'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green.shade300,
    );
  }
}
