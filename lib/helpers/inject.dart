import 'package:get_it/get_it.dart';
import 'package:mobx_example/stores/connectivity/connectivity.dart';
import 'package:mobx_example/stores/counter/counter.dart';

class Inject {
  static init() {
    registerStores();
  }

  static registerStores() {
    GetIt.I.registerLazySingleton<CounterStore>(() => CounterStore());
    GetIt.I.registerLazySingleton<ConnectivityStore>(() => ConnectivityStore());
  }
}
