// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import '../../../../core/error/failures.dart';
// import '../../../../services/api/location.dart';
// import '../../domain/repositories/location_repository.dart';
// import '../../../../models/location/location.dart';

// class LocationRepositoryImpl implements LocationRepository {
//   final LocationService locationService;

//   LocationRepositoryImpl({required this.locationService});

//   @override
//   Future<Either<Failure, LocationResponse>> getLocation() async {
//     try {
//       final result = await locationService.getLocation();
//       return Right(result);
//     } on DioException catch (e) {
//       return Left(
//         ServerFailure(
//           message: e.message ?? 'Failed to get location',
//           code: e.response?.statusCode.toString(),
//         ),
//       );
//     } catch (e) {
//       return Left(
//         ServerFailure(message: 'Unexpected error occurred', code: '500'),
//       );
//     }
//   }
// }
