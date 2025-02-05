// import 'package:get_it/get_it.dart';

// final getit = GetIt.instance;

// Future<void> setupGetIt() async {
//   Dio dio = DioFactory.getDio();
//   getit.registerLazySingleton<ApiService>(() => ApiService(dio));

//   // Login
//   getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit()));
//   getit.registerFactory<LoginCubit>(() => LoginCubit(getit<LoginRepo>()));

//   // Home
//   getit.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
//   getit.registerLazySingleton<HomeRepo>(() => HomeRepo(getit()));
//   getit.registerLazySingleton<HomeMandopDetailsRepo>(
//       () => HomeMandopDetailsRepo(getit()));
//   getit.registerFactory<HomeCubit>(() => HomeCubit(getit()));
//   getit.registerFactory<HomeMandopDetailsCubit>(
//       () => HomeMandopDetailsCubit(getit()));
//   getit.registerFactory<DataCubitFreezed>(() => DataCubitFreezed(getit()));

//   // Profile
//   getit.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
//   getit.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getit()));
//   getit.registerFactory<ProfileCubit>(() => ProfileCubit(getit()));

//   // History (Current Month Points)
//   getit.registerLazySingleton<HistoryApiService>(() => HistoryApiService(dio));
//   getit.registerLazySingleton<PointsHistoryRepo>(
//       () => PointsHistoryRepo(getit()));
//   getit.registerFactory<HistoryCubit>(() => HistoryCubit(getit()));

//   //Dates (Points By Month)
//   getit.registerLazySingleton<PointsByMonthRepo>(
//       () => PointsByMonthRepo(getit()));
//   getit.registerFactory<DateCubit>(() => DateCubit(getit()));
// }
