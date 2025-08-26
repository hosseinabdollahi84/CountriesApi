import 'dart:convert';
import 'package:arz3/model/model.dart';
import 'package:http/http.dart' as http;

class WelcomeService {
  Future<List<Welcome>> fetchCountries() async {
    final response = await http.get(
      Uri.parse(
        "https://restcountries.com/v3.1/all?fields=name,flags,capital,region,subregion,languages,currencies,tld,borders,population",
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Welcome.fromJson(json)).toList();
    } else {
      throw Exception('ارور داری 2');
    }
  }
}
