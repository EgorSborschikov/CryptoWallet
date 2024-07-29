import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details.dart';

import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository{
  CryptoCoinsRepository({
    required this.dio,
  });
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,AID,BSTN,SOL,CAG,DOV&tsyms=USD'
    );
    //debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries
      .map((e) { 
        final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final price = usdData['PRICE'];
        final imageUrl = usdData['IMAGEURL'];

        return CryptoCoin(
              name: e.key, 
              priceInUSD: price,
              imageUrl: 'https://www.cryptocompare.com/$imageUrl', details: null,
          );}).toList();
    return cryptoCoinsList;
  }
  
  @override
  Future<CryptoCoinDetails> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
      final data = response.data as Map<String, dynamic>;
      final dataRaw = data['RAW'] as Map<String, dynamic>;
      final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
      final usdData = coinData['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      final toSymbol = usdData['TOSYMBOL'];
      final lastUpdate = usdData['LASTUPDATE'];
      final high24Hour = usdData['HIGH24HOUR'];
      final low24Hour = usdData['LOW24HOUR'];

      return CryptoCoinDetails(
        name: currencyCode,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
        toSymbol: toSymbol,
        lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
        high24Hour: high24Hour,
        low24Hour: low24Hour,
      );
  }
}