import 'package:dio/dio.dart';

class RegisterRequestModel {
  final String name;
  final String phone;
  final String governorate;
  final String city;
  final String district;
  final String town;

  RegisterRequestModel({
    required this.name,
    required this.phone,
    required this.governorate,
    required this.city,
    required this.district,
    required this.town,
  });

  FormData toFormData() {
    return FormData.fromMap({
      "name": name,
      "phone": phone,
      "location[governorate]": governorate,
      "location[city]": city,
      "location[district]": district,
      "location[town]": town,
    });
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "location[governorate]": governorate,
      "location[city]": city,
      "location[district]": district,
      "location[town]": town,
    };
  }
}
