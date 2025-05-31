import '../../entities/prayer_time_entity.dart';

abstract class RegisterRepository {
  Future<void> register(RegisterEntity registerEntity);
}
