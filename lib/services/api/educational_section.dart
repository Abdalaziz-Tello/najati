// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dio/dio.dart';
import '../../config/header_config.dart';
import '../../core/constants/url_manager.dart';
import '../../core/error/exceptions.dart';
import '../../core/success/success.dart';
import '../../models/educational_section/get_all_stories_response.dart';
import '../../models/educational_section/get_story_response.dart';

abstract class EducationalSectionService {
  Future<GetAllStoriesResponse> getAllStories();
  Future<GetStoryResponse> getStory({required int storyId});
}

class EducationalSectionServiceImp implements EducationalSectionService {
  final Dio dio;

  EducationalSectionServiceImp({required this.dio});

  @override
  Future<GetAllStoriesResponse> getAllStories() async {
    try {
      final response = await dio.get(
        UrlManager.getSectionStory,
        options: HeaderConfig.getHeader(useToken: true),
      );

      if (response.statusCode == 200) {
        return GetAllStoriesResponse.fromJson(response.data);
      }
      throw ServerException(message: 'Failed to get stories');
    } on DioException catch (e) {
      log('Error in getAllStories: ${e.message}');
      throw ServerException(message: e.message ?? 'Failed to get stories');
    }
  }

  @override
  Future<GetStoryResponse> getStory({required int storyId}) async {
    try {
      final response = await dio.get(
        "${UrlManager.getStoryFromId}/$storyId",
        options: HeaderConfig.getHeader(useToken: true),
      );

      if (response.statusCode == 200) {
        return GetStoryResponse.fromJson(response.data);
      }
      throw ServerException(message: 'Failed to get story');
    } on DioException catch (e) {
      log('Error in getStory: ${e.message}');
      throw ServerException(message: e.message ?? 'Failed to get story');
    }
  }
}
