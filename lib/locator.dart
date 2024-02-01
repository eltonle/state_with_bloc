// 1 Create a get_it locator

import 'package:get_it/get_it.dart';
import 'package:state_with_bloc/models/controller/meme_controller.dart';
import 'package:state_with_bloc/repositories/orders/meme_repository.dart';

final locator = GetIt.instance;

// 2 Create a setep method and create our services
void setup() {
  locator.registerLazySingleton<MemeRepository>(() => MemeRepository());
  locator.registerLazySingleton<MemeController>(() => MemeController());
}
