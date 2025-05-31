// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import '../../../../core/error/failures.dart';
// import '../../../../models/prayer_times/prayer_times.dart';
// import '../../../../services/api/prayers.dart';
// import '../../domain/repositories/prayers_repository.dart';
// import '../../../../models/prayers/prayers_response.dart';

// class PrayersRepositoryImpl implements PrayersRepository {
//   final PrayersService prayersService;

//   PrayersRepositoryImpl({required this.prayersService});

//   @override
//   Future<Either<Failure, List<Prayer>>> getFivePrayers() async {
//     try {
//       final result = await prayersService.getFivePrayers();
//       return Right(result);
//     } on DioException catch (e) {
//       return Left(
//         ServerFailure(
//           message: e.message ?? 'Failed to get prayers',
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
