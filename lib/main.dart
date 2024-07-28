import 'package:crypto_coins_list/crypto_coins_list_app.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepo(dio: Dio()),
  );
  runApp(const CryptoCurrenciesApp());
}
