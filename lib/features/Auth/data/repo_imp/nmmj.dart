import '../../domain/entities/prayer_time_entity.dart';
import '../../domain/repo/prayer_status_tracker/prayer_tracking_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../model/register_request_model.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterService remoteDataSource;

  RegisterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> register(RegisterEntity registerEntity) async {
    final requestModel = RegisterRequestModel(
      name: registerEntity.name,
      phone: registerEntity.phone,
      governorate: registerEntity.governorate,
      city: registerEntity.city,
      district: registerEntity.district,
      town: registerEntity.town,
    );
    await remoteDataSource.register(requestModel);
  }
}
