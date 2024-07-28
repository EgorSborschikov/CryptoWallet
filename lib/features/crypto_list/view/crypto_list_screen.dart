import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repo.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryproCoinsList;

  @override
  void initState() {
    loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text ('Crypto Currencies List'),

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: (_cryproCoinsList == null)
          ? const Center(child: CircularProgressIndicator()) 
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _cryproCoinsList!.length,
              separatorBuilder: (context, index) => const Divider() ,
              itemBuilder: (context, i){
                final coin = _cryproCoinsList![i];
                return CryptoCoinTile(coin: coin);
              }
            ),
    );
  }

  Future<void> loadCryptoCoins() async {
    _cryproCoinsList = await CryptoCoinsRepo().getCoinsList(); //easely debug
    setState(() {
      
    });
  }
}

