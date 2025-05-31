import '../entities/prayer_time_entity.dart';
import '../repo/prayer_status_tracker/prayer_tracking_repository.dart';

class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase({required this.repository});

  Future<void> call(RegisterEntity registerEntity) {
    return repository.register(registerEntity);
  }
}
