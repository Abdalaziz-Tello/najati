import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:najati_test/core/constants/url_manager.dart';

import '../model/register_request_model.dart';
import '../model/verify_request_model.dart';
import '../model/verify_response_model.dart';

class RegisterService {
  final Dio dio = Dio();

  RegisterService();

  Future<bool> register(RegisterRequestModel request) async {
    try {
      final response = await dio.post(
        UrlManager.register,
        data: request.toJson(),
        options: Options(contentType: "application/x-www-form-urlencoded"),
      );

      if (response.statusCode == 200) {
        return true; // Success
      } else {
        return false; // Server returned an unexpected status
      }
    } catch (e) {
      return false; // Error during the request
    }
  }

  Future<dynamic> verify(Map<String, dynamic> model) async {
    try {
      VerifyResponseModel result;
      FormData formData = FormData.fromMap(model);
      print('🔗 URL: ${UrlManager.verify}');
      print("📦 Model to send: $model");

      final response = await dio.post(
        UrlManager.verify,
        data: formData,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      log("${response.statusCode}");
      print("$response");
      final data = response.data;
      result = VerifyResponseModel.fromJson(data);
      print("$result");
      // Check status key and handle accordingly
      if (result.status == 'success') {
        // Store tokens in Hive
        final authBox = Hive.box('authBox');
        authBox.put('accessToken', result.data!.tokens.accessToken);
        authBox.put('refreshToken', result.data!.tokens.refreshToken);

        return result;
      } else {
        return result.message;
      }
    } on DioException catch (e) {
      print("❌ Dio Error: ${e.response}");
      print("❌ Dio Error data: ${e.response?.data}");
      print("❌ Dio Error message: ${e.message}");
    }
  }
}
