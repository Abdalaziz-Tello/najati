import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

// box.get('token')
class HeaderConfig {
  static Options getHeader({useToken = true}) {
    var box = Hive.box('authBox');
    //
    if (useToken) {
      return Options(
        headers: {
          "accept": "*/*",
          "Authorization":
              "Bearer 2|UuTpr1CMu96g1PQvVVXbPBoO8VFAV2V2fuY68n0Pc0d11185",
          // "Authorization": "Bearer ${box.get('accessToken')}",
        },
      );
    } else {
      return Options(headers: {"Content-Type": "application/json"});
    }
  }
}
