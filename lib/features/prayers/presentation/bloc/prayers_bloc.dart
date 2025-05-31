// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:dartz/dartz.dart';
// import '../../../../core/error/failures.dart';
// import '../../../../models/prayers/prayers_response.dart';
// import '../../domain/usecases/get_five_prayers_usecase.dart';

// part 'prayers_event.dart';
// part 'prayers_state.dart';

// class PrayersBloc extends Bloc<PrayersEvent, PrayersState> {
//   final GetFivePrayersUseCase getFivePrayersUseCase;

//   PrayersBloc({required this.getFivePrayersUseCase}) : super(PrayersInitial()) {
//     on<GetFivePrayersEvent>(_onGetFivePrayers);
//   }

//   Future<void> _onGetFivePrayers(
//     GetFivePrayersEvent event,
//     Emitter<PrayersState> emit,
//   ) async {
//     emit(PrayersLoading());

//     final result = await getFivePrayersUseCase();

//     result.fold(
//       (failure) => emit(PrayersError(message: failure.message)),
//       (prayers) => emit(PrayersLoaded(prayers: prayers)),
//     );
//   }
// }
