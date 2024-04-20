import "package:get_it/get_it.dart";

import "exporters.dart";

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinRepository>(() => (CryptoCoinsRepository(dio: Dio())));
  runApp(const MyApp());
}
