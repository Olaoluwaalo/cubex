import 'dart:convert';
import 'package:cubex/core/constants/api_const.dart';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class ApiService {
  static const String baseUrl = 'https://restcountries.com/v3.1';

  Future<List<Country>> fetchAfricanCountries() async {
        try {
      final response = await http.get(Uri.parse(allCountries));
    

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((data) => Country.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load countries - ${response.statusCode}');
      }
    } catch (e) {
      
      throw Exception('Failed to load countries');
    }
  }

  Future<Country> fetchCountryDetails(String name) async {
    
    try {
      final response = await http.get(Uri.parse('$country/$name'));
      

      if (response.statusCode == 200) {
        return Country.fromJson(jsonDecode(response.body)[0]);
      } else {
        throw Exception('Failed to load country details - ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load country details');
    }
  }
}
