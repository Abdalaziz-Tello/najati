import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_account_from_settings_event.dart';
part 'get_account_from_settings_state.dart';

class GetAccountFromSettingsBloc extends Bloc<GetAccountFromSettingsEvent, GetAccountFromSettingsState> {
  GetAccountFromSettingsBloc() : super(GetAccountFromSettingsInitial()) {
    on<GetAccountFromSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
