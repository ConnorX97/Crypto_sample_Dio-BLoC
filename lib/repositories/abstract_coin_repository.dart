import 'package:crypto_coins/repositories/models/crypto_coin_model.dart';

abstract class AbstractCoinRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
