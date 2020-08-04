
import '../Data/coin_data.dart';
import 'networking.dart';

const apiKey = 'FBCD7D91-33DE-41C4-96C4-8ACC3B4CC7AF';
const endPoint = 'https://rest.coinapi.io/v1/exchangerate';

class CoinPrice {
  
  List<num> prices = [];

  Future<List<num>> getCoinPrice(String selectedCoin) async{
    for(final crypto in cryptoList){
      var url = '$endPoint/$crypto/$selectedCoin';

      NetworkHelper networkHelper = NetworkHelper(url: url, header: apiKey);

      var coinData = await networkHelper.getData();
      
      prices.add(coinData['rate']);
    }
    return prices;
  }

}

