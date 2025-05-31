import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/child/get_children_response.dart';
import '../repositories/children_repository.dart';

class GetChildrenUseCase {
  final ChildrenRepository repository;

  GetChildrenUseCase({required this.repository});

  Future<Either<Failure, GetChildrenResponse>> call() async {
    return await repository.getChildren();
  }
}
