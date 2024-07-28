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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text ('Crypto Currencies List'),

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider() ,
        itemBuilder: (context, i){
          const coinName = 'Bitcoin';
          return const CryptoCoinTile(coinName: coinName);
        }
      ),
    );
  }
}

