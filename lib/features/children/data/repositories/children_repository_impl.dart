import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/child/create_child_response.dart';
import '../../../../models/child/get_children_response.dart';
import '../../../../services/api/children.dart';
import '../../domain/repositories/children_repository.dart';

class ChildrenRepositoryImpl implements ChildrenRepository {
  final ChildrenService childrenService;

  ChildrenRepositoryImpl({required this.childrenService});

  @override
  Future<Either<Failure, CreateChildResponse>> createChild({
    required String name,
    required String gender,
    required String birthDate,
    required String image,
  }) async {
    try {
      final result = await childrenService.createChild(
        name: name,
        gender: gender,
        birthDate: birthDate,
        imagePath: image,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          message: e.message ?? 'Failed to create child',
          code: e.response?.statusCode.toString(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: 'Unexpected error occurred', code: '500'),
      );
    }
  }

  @override
  Future<Either<Failure, GetChildrenResponse>> getChildren() async {
    try {
      final result = await childrenService.getChildren();
      return Right(result);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          message: e.message ?? 'Failed to get children',
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
