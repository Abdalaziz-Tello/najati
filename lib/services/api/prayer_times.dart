// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dio/dio.dart';
import '../../config/header_config.dart';
import '../../core/constants/url_manager.dart';
import '../../core/error/exceptions.dart';
import '../../core/success/success.dart';
import '../../models/prayer_times/prayer_times.dart';

abstract class PrayerTimesService {
  Future<GetPrayerTimesResponse> getPrayerTimes();
}

class PrayerTimesServiceImp implements PrayerTimesService {
  final Dio dio;

  PrayerTimesServiceImp({required this.dio});

  @override
  Future<GetPrayerTimesResponse> getPrayerTimes() async {
    try {
      final response = await dio.get(
        UrlManager.getPrayerTimes,
        options: HeaderConfig.getHeader(useToken: true),
      );

      if (response.statusCode == 200) {
        return GetPrayerTimesResponse.fromJson(response.data);
      }
      throw ServerException(message: 'Failed to get prayer times');
    } on DioException catch (e) {
      log('Error in getPrayerTimes: ${e.message}');
      throw ServerException(message: e.message ?? 'Failed to get prayer times');
    }
  }
}
