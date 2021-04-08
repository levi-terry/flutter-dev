import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  final String urlString;
  Uri url;

  NetworkHelper(this.urlString){
    url = Uri.parse(urlString);
  }

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return Future.error("Unable to retrieve weather data.");
    }
  }
}