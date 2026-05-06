import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:taskify_app/model/user_model.dart';

class UserController extends GetxController {
   RxList users = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getUser() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        users.value = data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }
}