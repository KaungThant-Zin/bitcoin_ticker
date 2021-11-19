import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPI = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '5A565F54-D8DB-41BF-A702-A741ED56B1A1';

class CoinData {
  Future getCoinData() async {
    String url = '$coinAPI/BTC/USD?apikey=$apiKey';

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];

      return lastPrice;
    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}
