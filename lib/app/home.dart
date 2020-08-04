import 'package:currency_app/services/coin_price.dart';
import 'package:flutter/material.dart';
import '../Data/coin_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String coin = 'BRL';
  String selectedQuote;
  List<num> prices = [];

  Widget buildCardMessage(int cryptoCoin) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.lightBlue,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(prices.isNotEmpty
            ? '1 ${cryptoList[cryptoCoin]} = ${prices[cryptoCoin].toStringAsFixed(2)} $selectedQuote'
            : '1 ${cryptoList[cryptoCoin]} = ? $coin',
            textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  DropdownButton<String> dropdownItens() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19
          ),
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      iconEnabledColor: Colors.white,
      dropdownColor: Colors.lightBlue,
      value: coin,
      items: dropdownItems,
      onChanged: (value) async {
        var coinData = await CoinPrice().getCoinPrice(value);

        setState(() {
          coin = value;
          selectedQuote = value;
          //prices = coinData;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildCardMessage(0),
                buildCardMessage(1),
                buildCardMessage(2),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.lightBlue,
            padding: EdgeInsets.only(bottom: 30.0),
            child: dropdownItens(),
          ),
        ],
      ),
    );
  }
}
