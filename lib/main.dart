import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskify_app/Localization/local.dart';
import 'package:taskify_app/Localization/local_controller.dart';
import 'package:taskify_app/view/screens/home_screen.dart';

SharedPreferences? sharedprefe;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedprefe = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MyLocalController controllerLang = Get.put(
    MyLocalController(sharedprefe!),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 948),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controllerLang.locale.value,
      translations: MyLocal(),
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomeScreen(),
    );});
  }
}
