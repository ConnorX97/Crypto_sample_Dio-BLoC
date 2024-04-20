import 'package:crypto_coins/views/crypto_coin/cryptoCoin_screen.dart';
import 'package:crypto_coins/views/crypto_list/list_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppRouter {
  static String get initalRoute => AppRoutes.home;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.home: (context) => const CryptoListScreen(),
        AppRoutes.coin: (context) => const CryptoCoinScreen(),
      };
}

abstract final class AppRoutes {
  static const home = "/";
  static const coin = "/coin";
  static var initalRoute;
}
