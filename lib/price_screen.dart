import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedValue = 'USD';

  List<DropdownMenuItem<String>> getDropdown() {
    List<DropdownMenuItem<String>> dropList = [];
    for (String currency in currenciesList) {
      var dropItems = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropList.add(dropItems);
    }
    return dropList;
  }

  String bitcoinValueInUSD = '?';

  void getData() async {
    try {
      double data = await CoinData().getCoinData();
      setState(() {
        bitcoinValueInUSD = data.toStringAsFixed(0);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitcoinValueInUSD USD',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedValue,
              items: getDropdown(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              dropdownColor: Colors.lightBlue[600],
            ),
          ),
        ],
      ),
    );
  }
}
