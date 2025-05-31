import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/educational_section/get_all_stories_response.dart';
import '../repositories/educational_section_repository.dart';

class GetAllStoriesUseCase {
  final EducationalSectionRepository repository;

  GetAllStoriesUseCase({required this.repository});

  Future<Either<Failure, GetAllStoriesResponse>> call() async {
    return await repository.getAllStories();
  }
}
