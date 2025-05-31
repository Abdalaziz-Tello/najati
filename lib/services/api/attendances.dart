import 'package:dio/dio.dart';
import 'package:najati_test/config/header_config.dart';
import 'package:najati_test/core/constants/url_manager.dart';
import '../../models/attendances/send_prayer_status_response.dart';

class AttendancesService {
  final Dio _dio;

  AttendancesService(this._dio);

  Future<SendPrayerStatusResponse> sendPrayerStatus({
    required List<Map<String, dynamic>> attendances,
  }) async {
    final response = await _dio.post(
      UrlManager.sendInfoChild,
      data: {'attendances': attendances},
      options: HeaderConfig.getHeader(useToken: true),
    );

    return SendPrayerStatusResponse.fromJson(response.data);
  }
}
