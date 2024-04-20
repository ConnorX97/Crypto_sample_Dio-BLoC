import 'dart:async';

import 'package:crypto_coins/exporters.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part "crypto_list_event.dart";
part "crypto_list_state.dart";

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoLostLoaded) {
          emit(CryptoLostLoading());
        }
        final coinsList = await coinRepository.getCoinsList();
        emit(CryptoLostLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinRepository coinRepository;
}
