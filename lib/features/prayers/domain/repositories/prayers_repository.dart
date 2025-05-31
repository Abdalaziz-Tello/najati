import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/prayer_times/prayer_times.dart';
import '../../../../models/prayers/prayers_response.dart';

abstract class PrayersRepository {
  Future<Either<Failure, GetPrayerTimesResponse>> getFivePrayers();
}
