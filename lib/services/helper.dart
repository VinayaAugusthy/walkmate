import 'dart:convert';

import 'package:walkmate/models/sneakers_model.dart';
import 'package:http/http.dart' as http;

class Hepler {
  Future<List<Product>> getMaleSneakers() async {
    String uri = 'https://dummyjson.com/products/category/mens-shoes';

    final url = Uri.parse(uri);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final MaleSneakers maleSneakers = MaleSneakers.fromJson(data);
      return maleSneakers.products;
    } else {
      throw Exception("Failed to load male sneakers");
    }
  }
}
