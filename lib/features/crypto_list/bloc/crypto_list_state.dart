part of 'crypto_list_bloc.dart';

class CryptoListState {
  
}

class CryptoListInitial extends CryptoListState{

}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptolistLoaded extends CryptoListState{
  CryptolistLoaded({
    required this.coinsList,
  });

  final List<CryptoCoin> coinsList;
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({
    this.exception,
  });

  final Object? exception;
}