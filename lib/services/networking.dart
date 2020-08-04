import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url, this.header});

  final String url;
  final String header;

  Future getData() async {
    http.Response response = await http.get(url, headers: {'X-CoinAPI-Key': '$header'} );
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}