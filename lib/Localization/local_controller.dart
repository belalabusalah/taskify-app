import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocalController extends GetxController {
  final SharedPreferences prefs;

  MyLocalController(this.prefs);

  final Rx<Locale> locale = const Locale('en').obs;

  @override
  void onInit() {
    super.onInit();
    _loadLang();
  }

  void _loadLang() {
    final lang = prefs.getString("lang");

    if (lang == null) {
      locale.value = Get.deviceLocale ?? const Locale('en');
    } else {
      locale.value = Locale(lang);
    }

    Get.updateLocale(locale.value);
  }

  void changeLang(String code) {
    final newLocale = Locale(code);

    locale.value = newLocale;
    prefs.setString("lang", code);

    Get.updateLocale(newLocale);
  }

  void toggleLang() {
    changeLang(locale.value.languageCode == 'ar' ? 'en' : 'ar');
  }
}

/*class MyLocalController extends GetxController {
  Locale initialLang =
  sharedprefe?.getString("lang")==null ? Get.deviceLocale!:Locale(sharedprefe!.getString("lang")!);


  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    sharedprefe!.setString("lang", codelang);
    Get.updateLocale(locale);
  }

  void toggleLang() {
    if (Get.locale?.languageCode == 'ar') {
      changeLang("en");
    } else {
      changeLang("ar");
    }
  }
}*/
