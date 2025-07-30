import 'package:get_it/get_it.dart';
import 'package:good_mood/core/local_data_source/cache_helper.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //shared preferences
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  // Dio
  // getIt.registerSingleton<Dio>(Dio());
  // //Api Methods
  // getIt.registerSingleton<ApiMethods>(DioMethods(getIt()));
}
