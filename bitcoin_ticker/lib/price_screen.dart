import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  CoinData coinData = CoinData();
  bool isWaiting = true;

  void updatePrices() async {
    await coinData.getPrices(selectedCurrency);
    setState(() {
      isWaiting = false;
    });
  }

  DropdownButton<String> getDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesDropdown,
      dropdownColor: Colors.lightBlue,
      onChanged: (value) {
        setState(() {
          isWaiting = true;
          selectedCurrency = value;
          updatePrices();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bitcoin Ticker',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TickerBar(
                  label: isWaiting
                      ? "1 BTC = ? $selectedCurrency"
                      : "1 BTC = ${coinData.btcPrice} $selectedCurrency"),
              TickerBar(
                  label: isWaiting
                      ? "1 ETH = ? $selectedCurrency"
                      : "1 ETH = ${coinData.ethPrice} $selectedCurrency"),
              TickerBar(
                  label: isWaiting
                      ? "1 LTC = ? $selectedCurrency"
                      : "1 LTC = ${coinData.ltcPrice} $selectedCurrency"),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : getDropdown(),
          ),
        ],
      ),
    );
  }
}

class TickerBar extends StatelessWidget {
  final String label;

  TickerBar({@required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
