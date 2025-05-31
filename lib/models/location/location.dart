import 'package:dio/dio.dart';

class Governorate {
  final String name;

  Governorate({required this.name});

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(name: json['name']);
  }
}

class City {
  final String name;

  City({required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(name: json['name']);
  }
}

class District {
  final String name;

  District({required this.name});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(name: json['name']);
  }
}

class Town {
  final String name;

  Town({required this.name});

  factory Town.fromJson(Map<String, dynamic> json) {
    return Town(name: json['name']);
  }
}

class LocationService {
  final Dio dio;

  LocationService(this.dio);

  Future<List<T>> fetchLocationList<T>(
    String url,
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await dio.get(url);
      print('%');
      if (response.statusCode == 200 &&
          response.data['status'] == 'success' &&
          response.data['data'] != null &&
          response.data['data'][key] != null) {
        final List list = response.data['data'][key];
        return list.map((e) => fromJson(e)).toList();
      } else {
        throw Exception('Invalid response: ${response.data}');
      }
    } catch (e) {
      throw Exception('Failed to load $key: $e');
    }
  }
}
