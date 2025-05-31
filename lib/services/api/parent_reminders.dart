import 'package:dio/dio.dart';
import '../../config/header_config.dart';
import '../../core/constants/url_manager.dart';
import '../../models/parent_reminder/create_reminder_response.dart';
import '../../models/parent_reminder/get_reminder_response.dart';

class RemindersService {
  final Dio _dio;

  RemindersService(this._dio);

  Future<CreateReminderResponse> createReminder({
    required int prayerId,
    required int childId,
    required int minutes,
  }) async {
    final formData = FormData.fromMap({
      'prayer_id': prayerId,
      'child_id': childId,
      'minutes': minutes,
    });

    final response = await _dio.post(
      UrlManager.createParentReminder,
      options: HeaderConfig.getHeader(useToken: true),
      data: formData,
    );

    return CreateReminderResponse.fromJson(response.data);
  }

  Future<GetReminderResponse> getReminders({required int childId}) async {
    final response = await _dio.get(
      '${UrlManager.getParentReminder}/$childId/reminders',
      options: HeaderConfig.getHeader(useToken: true),
    );

    return GetReminderResponse.fromJson(response.data);
  }
}
