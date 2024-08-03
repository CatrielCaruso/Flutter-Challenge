import 'package:get_it/get_it.dart';

import 'package:flutter_challenge/data/database/isar_database.dart';
import 'package:flutter_challenge/data/simpson_services.dart';

final locator = GetIt.I;
void serviceLocatorInit() {
  locator.registerSingleton(SimpsonServices());
  locator.registerSingleton(IsarDataBase());
}
