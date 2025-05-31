// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:dartz/dartz.dart';
// import '../../../../core/error/failures.dart';
// import '../../../../models/location/location.dart';
// import '../../domain/usecases/get_location_usecase.dart';

// part 'location_event.dart';
// part 'location_state.dart';

// class LocationBloc extends Bloc<LocationEvent, LocationState> {
//   final GetLocationUseCase getLocationUseCase;

//   LocationBloc({required this.getLocationUseCase}) : super(LocationInitial()) {
//     on<GetLocationEvent>(_onGetLocation);
//   }

//   Future<void> _onGetLocation(
//     GetLocationEvent event,
//     Emitter<LocationState> emit,
//   ) async {
//     emit(LocationLoading());

//     final result = await getLocationUseCase();

//     result.fold(
//       (failure) => emit(LocationError(message: failure.message)),
//       (location) => emit(LocationLoaded(location: location)),
//     );
//   }
// }
