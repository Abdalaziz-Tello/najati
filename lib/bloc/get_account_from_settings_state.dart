part of 'get_account_from_settings_bloc.dart';

sealed class GetAccountFromSettingsState extends Equatable {
  const GetAccountFromSettingsState();
  
  @override
  List<Object> get props => [];
}

final class GetAccountFromSettingsInitial extends GetAccountFromSettingsState {}
