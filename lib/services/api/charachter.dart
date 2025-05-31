// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dio/dio.dart';
import '../../config/header_config.dart';
import '../../core/constants/url_manager.dart';
import '../../core/error/exceptions.dart';
import '../../models/charachter_model.dart';

abstract class CharachterService {
  Future<bool> createCharachter({required int num});
  Future<GetCharacters> getCharachters();
}

class CharacterServiceImp implements CharachterService {
  final Dio dio;

  CharacterServiceImp({required this.dio});

  @override
  Future<bool> createCharachter({required int num}) async {
    try {
      final response = await dio.post(
        UrlManager.createCharachter + num.toString(),
        options: HeaderConfig.getHeader(useToken: true),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log('Error in createChild: ${e.message}');
      throw ServerException(
        message:
            e.message ?? 'حدث خطأ أثناء إنشاء حساب لطفلك يرجى المحاولة لاحقا',
      );
    }
  }

  @override
  Future<GetCharacters> getCharachters() async {
    try {
      final response = await dio.get(
        UrlManager.getCharachters,
        options: HeaderConfig.getHeader(useToken: true),
      );

      if (response.statusCode == 200) {
        return GetCharacters.fromJson(response.data);
      } else {
        throw ServerException(message: 'حدث خطأ أثناء جلب الشخصيات');
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'فشل الاتصال بالخادم. حاول لاحقاً.',
      );
    }
  }
}
