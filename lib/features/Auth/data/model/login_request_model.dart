import 'package:dio/dio.dart';

class LoginRequestModel {
  final String phone;

  LoginRequestModel({required this.phone});

  /// Converts the model into FormData for API requests
  FormData toFormData() {
    return FormData.fromMap({'phone': phone});
  }
}
