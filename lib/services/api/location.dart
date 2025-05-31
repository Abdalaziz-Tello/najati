// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:developer';

// import 'package:dio/dio.dart';
// import '../../config/header_config.dart';
// import '../../core/constants/url_manager.dart';
// import '../../core/error/exceptions.dart';
// import '../../core/success/success.dart';
// import '../../models/location/location.dart';

// abstract class LocationService {
//   Future<LocationResponse> getLocation();
// }

// class LocationServiceImp implements LocationService {
//   final Dio dio;

//   LocationServiceImp({required this.dio});

//   @override
//   Future<LocationResponse> getLocation() async {
//     try {
//       final response = await dio.get(
//         UrlManager.getLocation,
//         options: HeaderConfig.getHeader(useToken: true),
//       );

//       if (response.statusCode == 200) {
//         return LocationResponse.fromJson(response.data);
//       }
//       throw ServerException(message: 'Failed to get location');
//     } on DioException catch (e) {
//       log('Error in getLocation: ${e.message}');
//       throw ServerException(message: e.message ?? 'Failed to get location');
//     }
//   }
// }
