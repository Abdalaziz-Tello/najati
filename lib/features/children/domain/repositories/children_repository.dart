import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/child/create_child_response.dart';
import '../../../../models/child/get_children_response.dart';

abstract class ChildrenRepository {
  Future<Either<Failure, CreateChildResponse>> createChild({
    required String name,
    required String gender,
    required String birthDate,
    required String image,
  });

  Future<Either<Failure, GetChildrenResponse>> getChildren();
}
