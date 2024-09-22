import 'package:fruits_app/core/db/cached_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
