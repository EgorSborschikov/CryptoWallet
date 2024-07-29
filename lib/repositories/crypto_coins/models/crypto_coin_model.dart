//import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{

const CryptoCoin({
    required this.name, 
    required this.priceInUSD,
    required this.imageUrl, required details,
  });

  final String name;
  final double priceInUSD;  
  final String imageUrl;
  
  @override
  List<Object?> get props => [name, priceInUSD, imageUrl];

  get details => null;
}
