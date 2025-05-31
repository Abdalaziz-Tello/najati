// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import '../../config/header_config.dart';
import '../../core/constants/url_manager.dart';
import '../../core/error/exceptions.dart';
import '../../core/success/success.dart';
import '../../models/child/create_child_response.dart';
import '../../models/child/get_children_response.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

abstract class ChildrenService {
  Future<CreateChildResponse> createChild({
    required String name,
    required String gender,
    required String birthDate,
    required String imagePath,
  });
  Future<GetChildrenResponse> getChildren();
}

class ChildrenServiceImp implements ChildrenService {
  final Dio dio;

  ChildrenServiceImp({required this.dio});
  @override
  Future<CreateChildResponse> createChild({
    required String name,
    required String gender,
    required String birthDate,
    required String imagePath,
  }) async {
    try {
      log("🔔 Started createChild()");
      log("📍 API URL: ${UrlManager.createChild}");
      log("📦 Image asset path: $imagePath");

      // 🔧 Helper to convert asset image to a File
      Future<File> getAssetImageFile(String assetPath) async {
        final byteData = await rootBundle.load(assetPath);
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/temp_image.png');
        await file.writeAsBytes(byteData.buffer.asUint8List());
        return file;
      }

      final file = await getAssetImageFile(imagePath);

      if (!(await file.exists())) {
        log("❌ File does not exist after conversion: ${file.path}");
        throw Exception("ملف الصورة غير موجود");
      }

      log("✅ File ready at: ${file.path}");
      final formData = FormData.fromMap({
        'name': name,
        'gender': gender,
        'birth_date': birthDate,
        'image': await MultipartFile.fromFile(file.path),
      });

      // Log fields manually
      log("name: ${formData.fields.firstWhere((f) => f.key == 'name').value}");
      log(
        "gender: ${formData.fields.firstWhere((f) => f.key == 'gender').value}",
      );
      log(
        "birth_date: ${formData.fields.firstWhere((f) => f.key == 'birth_date').value}",
      );
      log(
        "image filename: ${(formData.files.firstWhere((f) => f.key == 'image').value as MultipartFile).filename}",
      );

      log("✅ File ready at: ${formData}");
      log("📤 Sending request to create child...");

      final response = await dio.post(
        UrlManager.createChild,
        options: HeaderConfig.getHeader(useToken: true),
        data: formData,
      );

      log("✅ Request successful, parsing response...");

      return CreateChildResponse.fromJson(response.data);
    } on DioException catch (e) {
      log("❌ DioException occurred");
      log("❌ Message: ${e.message}");
      log("❌ Response data: ${e.response?.data}");

      throw ServerException(
        message:
            e.response?.data['message'] ??
            'حدث خطأ أثناء إنشاء حساب لطفلك يرجى المحاولة لاحقا',
      );
    } catch (e, stack) {
      log("❌ Unexpected Error: $e");
      log("📄 Stacktrace:\n$stack");
      throw ServerException(message: 'حدث خطأ غير متوقع');
    }
  }

  @override
  Future<GetChildrenResponse> getChildren() async {
    try {
      final response = await dio.get(
        UrlManager.getChildren,
        options: HeaderConfig.getHeader(useToken: true),
      );

      if (response.statusCode == 200) {
        return GetChildrenResponse.fromJson(response.data);
      }
      throw ServerException(message: 'Failed to get children');
    } on DioException catch (e) {
      log('Error in getChildren: ${e.message}');
      throw ServerException(message: e.message ?? 'Failed to get children');
    }
  }
}
