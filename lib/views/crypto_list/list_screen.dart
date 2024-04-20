import 'dart:async';

import 'package:crypto_coins/features/bloc/crypto_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../exporters.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Crypto Coins",
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoLostLoaded) {
                return Center(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white24,
                    ),
                    itemCount: state.coinsList.length,
                    itemBuilder: (context, i) {
                      final coin = state.coinsList![i];
                      return CoinTile(
                        coin: coin,
                        textTheme: textTheme,
                      );
                    },
                  ),
                );
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Something went wrong",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Please try again later",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            _cryptoListBloc.add(LoadCryptoList());
                          },
                          child: const Text(
                            "Try again",
                            style: TextStyle(color: Colors.amber),
                          ))
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              );
            },
          ),
        ));
  }

  // Future<void> _loadCryptoCoins() async {
  //   _cryptoCoinsList = await GetIt.I<AbstractCoinRepository>().getCoinsList();
  //   setState(() {});
  // }
}
