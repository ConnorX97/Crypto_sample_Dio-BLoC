part of "crypto_list_bloc.dart";

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoLostLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoLostLoaded extends CryptoListState {
  final List<CryptoCoin> coinsList;
  CryptoLostLoaded({required this.coinsList});
  
  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;
  CryptoListLoadingFailure({this.exception});
  
  @override
  List<Object?> get props => [exception];
}
