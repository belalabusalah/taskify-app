import 'package:taskify_app/model/address_model.dart';
import 'package:taskify_app/model/company_model.dart';

class UserModel {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] ?? "",
      phone: json["phone"] ?? "",
      website: json["website"] ?? "",
      company: json["company"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "address": address,
      "phone": phone,
      "website": website,
      "company": company,
    };
  }
}



