import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/child/create_child_response.dart';
import '../repositories/children_repository.dart';

class CreateChildUseCase {
  final ChildrenRepository repository;

  CreateChildUseCase({required this.repository});

  Future<Either<Failure, CreateChildResponse>> call({
    required String name,
    required String gender,
    required String birthDate,
    required String imagePath,
  }) async {
    return await repository.createChild(
      name: name,
      gender: gender,
      birthDate: birthDate,
      image: imagePath,
    );
  }
}
