import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify_app/Localization/local_controller.dart';
import 'package:taskify_app/controller/controller_screen_user.dart';
import 'package:taskify_app/main.dart';
import 'package:taskify_app/view/custom_widget/custom_app_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final MyLocalController _controllerLang = Get.put(
    MyLocalController(sharedprefe!),
  );
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            _controllerLang.toggleLang();
          },
          child: Obx(
            () => AppText.subtitle(_controllerLang.locale.value.languageCode),
          ),
        ),
        title: AppText.title("home screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              _userController.getUser();
            },
            child: AppText.caption("trans", color: Colors.amber),
          ),
          SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: _userController.users.length,
              itemBuilder: (context, index) {
                final user = _userController.users[index];
                return ListTile(
                  title: AppText.subtitle(user.name),
                  subtitle: AppText.body(user.email),
                  leading: AppText.caption(user.username),
                  trailing: AppText.title("${user.id}"),

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
