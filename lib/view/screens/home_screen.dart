import 'package:flutter/material.dart';
import 'package:taskify_app/view/custom_widget/custom_app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppText.title("home screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          AppText.subtitle("home screen"),
        ],
      ),
    );
  }
}
