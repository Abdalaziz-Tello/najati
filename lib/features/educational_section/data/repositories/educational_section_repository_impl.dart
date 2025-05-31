import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../services/api/educational_section.dart';
import '../../domain/repositories/educational_section_repository.dart';
import '../../../../models/educational_section/get_all_stories_response.dart';

class EducationalSectionRepositoryImpl implements EducationalSectionRepository {
  final EducationalSectionService educationalSectionService;

  EducationalSectionRepositoryImpl({required this.educationalSectionService});

  @override
  Future<Either<Failure, GetAllStoriesResponse>> getAllStories() async {
    try {
      final result = await educationalSectionService.getAllStories();
      return Right(result);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          message: e.message ?? 'Failed to get stories',
          code: e.response?.statusCode.toString(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: 'Unexpected error occurred', code: '500'),
      );
    }
  }
}
