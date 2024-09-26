import 'package:fruits_app/core/db/cached_helper.dart';
import 'package:fruits_app/core/service/fire_base_services.dart';
import 'package:fruits_app/core/service/firestore_services.dart';
import 'package:fruits_app/core/widgets/custom_snack_bar.dart';
import 'package:fruits_app/featuers/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_app/featuers/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<FireBaseServices>(FireBaseServices());
  getIt.registerSingleton<FireStoreServices>(FireStoreServices());
  getIt.registerSingleton<CustomSnackBar>(CustomSnackBar());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      fireBaseServices: getIt<FireBaseServices>(),
      databaseServices: getIt<FireStoreServices>()));
}
