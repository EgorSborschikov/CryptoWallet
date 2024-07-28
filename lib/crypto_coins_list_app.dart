import 'package:crypto_coins_list/router/router.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesApp extends StatelessWidget {
  const CryptoCurrenciesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currencies App',
      theme: darkTheme,
      routes: routes,
    );
  }
}