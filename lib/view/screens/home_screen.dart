import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify_app/Localization/local_controller.dart';
import 'package:taskify_app/main.dart';
import 'package:taskify_app/view/custom_widget/custom_app_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final MyLocalController controllerLang = Get.put(MyLocalController(sharedprefe!));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText.title("home screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText.subtitle("home screen"),

          SizedBox(
              height: 50,
          ),

          ElevatedButton(
            onPressed: () {
              controllerLang.toggleLang();
            },
            child: AppText.caption("trans", color: Colors.amber),
          ),
          SizedBox(
            height: 50,
          ),

          Obx(
                  () => AppText.subtitle(
                      controllerLang.locale.value.languageCode
                  )
          ),
        ],
      ),
    );
  }
}
