import 'package:flutter/material.dart';
import 'networking.dart';

const ccUrl =
    "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=";
const apiKey = "&api_key=getyourownkey"; //TODO: Insert API key

const List<DropdownMenuItem<String>> currenciesDropdown = [
  DropdownMenuItem(child: Text('AUD'), value: 'AUD'),
  DropdownMenuItem(child: Text('BRL'), value: 'BRL'),
  DropdownMenuItem(child: Text('CAD'), value: 'CAD'),
  DropdownMenuItem(child: Text('CNY'), value: 'CNY'),
  DropdownMenuItem(child: Text('EUR'), value: 'EUR'),
  DropdownMenuItem(child: Text('GBP'), value: 'GBP'),
  DropdownMenuItem(child: Text('HKD'), value: 'HKD'),
  DropdownMenuItem(child: Text('IDR'), value: 'IDR'),
  DropdownMenuItem(child: Text('ILS'), value: 'ILS'),
  DropdownMenuItem(child: Text('INR'), value: 'INR'),
  DropdownMenuItem(child: Text('JPY'), value: 'JPY'),
  DropdownMenuItem(child: Text('MXN'), value: 'MXN'),
  DropdownMenuItem(child: Text('NOK'), value: 'NOK'),
  DropdownMenuItem(child: Text('NZD'), value: 'NZD'),
  DropdownMenuItem(child: Text('PLN'), value: 'PLN'),
  DropdownMenuItem(child: Text('RON'), value: 'RON'),
  DropdownMenuItem(child: Text('RUB'), value: 'RUB'),
  DropdownMenuItem(child: Text('SEK'), value: 'SEK'),
  DropdownMenuItem(child: Text('SGD'), value: 'SGD'),
  DropdownMenuItem(child: Text('USD'), value: 'USD'),
  DropdownMenuItem(child: Text('ZAR'), value: 'ZAR'),
];

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

class CoinData {
  String btcPrice;
  String ethPrice;
  String ltcPrice;

  Future<void> getPrices(String currency) async {
    NetworkHelper networkHelper = NetworkHelper("$ccUrl$currency$apiKey");
    var coinData = await networkHelper.getData();
    this.btcPrice = coinData["BTC"][currency].toString();
    this.ethPrice = coinData["ETH"][currency].toString();
    this.ltcPrice = coinData["LTC"][currency].toString();
  }
}
