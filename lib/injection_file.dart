
// final sl = GetIt.instance;

// Future<void> initializeDependencies() async {
//   // Registering Dio
//   sl.registerSingleton<Dio>(Dio());

//   // Registering InternetConnectionChecker
//   sl.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker());

//   // Registering NetworkConnection
//   sl.registerSingleton<NetworkConnection>(NetworkConnection(
//     internetConnectionChecker: sl<InternetConnectionChecker>(),
//   ));

//   // Registering AuthServiceImp
//   sl.registerSingleton<AuthServiceImp>(AuthServiceImp(dio: sl()));

//   // Registering RegisterRepoImpl
//   sl.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(
//     authServiceImp: sl(),
//     networkConnection: sl<NetworkConnection>(),
//   ));

//   // Registering RegisterUseCase
//   sl.registerSingleton<RegisterUseCase>(
//       RegisterUseCase(registerRepoImpl: sl()));

//   // Registering AuthBloc
//   sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
// //___________________________________

//   sl.registerSingleton<LogInUseCase>(LogInUseCase(registerRepoImpl: sl()));

//   sl.registerFactory<LogInBloc>(() => LogInBloc(sl()));

// //__________________________________
//   sl.registerSingleton<CategoriesServiceImp>(CategoriesServiceImp(dio: Dio()));
//   sl.registerSingleton<CategoryRepoImpl>(CategoryRepoImpl(
//     categoriesServiceImp: sl(),
//     networkConnection: sl<NetworkConnection>(),
//   ));

//   sl.registerSingleton<CategoryUseCase>(
//       CategoryUseCase(categoryRepoImpl: sl()));

//   sl.registerFactory<CategoryBloc>(() => CategoryBloc(sl()));

//   sl.registerSingleton<BicycleUseCase>(BicycleUseCase(categoryRepoImpl: sl()));

//   sl.registerFactory<BicycleBloc>(() => BicycleBloc(sl()));
//   //___________________________________
//   sl.registerSingleton<HubContentServiceImp>(HubContentServiceImp(dio: sl()));

//   sl.registerSingleton<HubContenRepoImpl>(HubContenRepoImpl(
//     hubContentServiceImp: sl(),
//     networkConnection: sl<NetworkConnection>(),
//   ));

//   sl.registerSingleton<GetHubContentsUseCase>(
//       GetHubContentsUseCase(hubContenRepoImpl: sl()));
//   sl.registerFactory<HubContentsBloc>(() => HubContentsBloc(sl()));
// //_____________________________________

//   sl.registerSingleton<HubServiceImp>(HubServiceImp(dio: sl()));

//   sl.registerSingleton<HubRepoImpl>(HubRepoImpl(
//     hubServiceImp: sl(),
//     networkConnection: sl<NetworkConnection>(),
//   ));

//   sl.registerSingleton<HubUseCase>(HubUseCase(hubRepoImpl: sl()));

//   sl.registerFactory<HubBloc>(() => HubBloc(sl()));
// //____________________________________
//   sl.registerSingleton<ReservationServiceImp>(ReservationServiceImp(dio: sl()));

//   sl.registerSingleton<ReservationRepoImpl>(
//       ReservationRepoImpl(reservationServiceImp: sl()));

//   sl.registerSingleton<ReservationUseCase>(
//       ReservationUseCase(reservationRepoImpl: sl()));

//   sl.registerFactory<ReservationBloc>(() => ReservationBloc(sl()));
//   //________________________________
//   sl.registerSingleton<policyServiceImp>(policyServiceImp(dio: sl()));

//   sl.registerSingleton<policyRepoImpl>(policyRepoImpl(
//     policServiceImp: sl(),
//     networkConnection: sl<NetworkConnection>(),
//   ));

//   sl.registerSingleton<policyUseCase>(policyUseCase(policRepoImpl: sl()));

//   sl.registerFactory<policyBloc>(() => policyBloc(sl()));
//   //====================
//   sl.registerSingleton<putpolicyUseCase>(putpolicyUseCase(policRepoImpl: sl()));

//   sl.registerFactory<putpolicyBloc>(() => putpolicyBloc(sl()));
//   //________________________________
//   sl.registerSingleton<changepasswordServiceImp>(
//       changepasswordServiceImp(dio: sl()));

//   sl.registerSingleton<changepasswordRepoImpl>(changepasswordRepoImpl(
//     changepassworServiceImp: sl(),
//     networkConnection: sl<NetworkConnection>(),
//   ));

//   sl.registerSingleton<changepasswordUseCase>(
//       changepasswordUseCase(changepassworImpl: sl()));

//   sl.registerFactory<changepasswordBloc>(() => changepasswordBloc(sl()));
//   //_______________________________

//   sl.registerSingleton<WalletCreationServiceImp>(
//       WalletCreationServiceImp(dio: sl()));

//   sl.registerSingleton<WalletCreationRepoImpl>(
//       WalletCreationRepoImpl(walletCreationServiceImp: sl()));

//   sl.registerSingleton<WalletCreationUseCase>(
//       WalletCreationUseCase(walletCreationRepoImp: sl()));

//   sl.registerFactory<WalletCreationBloc>(() => WalletCreationBloc(sl()));

//   //___________________________________________

//   sl.registerSingleton<WalletInfoServiceImp>(WalletInfoServiceImp(dio: sl()));

//   sl.registerSingleton<WalletInfoRepoImp>(
//       WalletInfoRepoImp(walletInfoServiceImp: sl()));

//   sl.registerSingleton<WalletInfoUseCase>(
//       WalletInfoUseCase(walletInfoRepoImp: sl()));

//   sl.registerFactory<WalletInfoBloc>(() => WalletInfoBloc(sl()));


//   //-------------------------------------------
//     sl.registerSingleton<CodeInfoServiceImp>(CodeInfoServiceImp(dio: sl()));

//   sl.registerSingleton<CodeInfoRepoImp>(
//       CodeInfoRepoImp(codeInfoServiceImp: sl()));

//   sl.registerSingleton<CodeInfoUseCase>(
//       CodeInfoUseCase(codeInfoRepoImp: sl()));

//   sl.registerFactory<CodesListBloc>(() => CodesListBloc(sl()));
  
//   //-------------------------------------------
//     sl.registerSingleton<AddMoneyServiceImp>(AddMoneyServiceImp(dio: sl()));

//   sl.registerSingleton<AddMoneyRepoImpl>(
//       AddMoneyRepoImpl(addMoneyServiceImp: sl()));

//   sl.registerSingleton<AddMoneyUseCase>(
//       AddMoneyUseCase(addMoneyRepoImpl: sl()));

//   sl.registerFactory<AddMoneyBloc>(() => AddMoneyBloc(sl()));

// }