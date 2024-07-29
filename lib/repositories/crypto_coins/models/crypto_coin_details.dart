import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable{
  
  final String name;
  final String toSymbol;
  final DateTime lastUpdate;
  final String high24Hour;
  final String low24Hour;
  final double priceInUSD;
  final String imageUrl;

  const CryptoCoinDetails({
    required this.name,
    required this.toSymbol, 
    required this.lastUpdate, 
    required this.high24Hour, 
    required this.low24Hour, 
    required this.priceInUSD, 
    required this.imageUrl});
  
  @override
  List<Object> get props => [
        toSymbol,
        lastUpdate,
        high24Hour,
        low24Hour,
        priceInUSD,
        imageUrl,
      ];
}
