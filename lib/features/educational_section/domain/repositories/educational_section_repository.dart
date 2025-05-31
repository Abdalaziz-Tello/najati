import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/educational_section/get_all_stories_response.dart';

abstract class EducationalSectionRepository {
  Future<Either<Failure, GetAllStoriesResponse>> getAllStories();
}
