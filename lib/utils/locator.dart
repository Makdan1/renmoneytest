import 'package:renmoneytest/core/services/transaction_service.dart';
import 'package:get_it/get_it.dart';
import 'package:renmoneytest/utils/progressBarManager/dialog_service.dart';
import 'package:renmoneytest/utils/router/navigation_service.dart';

GetIt locator = GetIt.instance;
// This inject all services using GetIt package
Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());
  locator.registerLazySingleton(() => TransactionService());

}
