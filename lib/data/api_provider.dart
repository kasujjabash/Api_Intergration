import 'package:dealfinder/modules/gargets_module.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider {
  Future<List<Product>> fetchProducts() async {
    try {
      final url = Uri.parse('https://dummyjson.com/products');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<Product> products = List<Product>.from(
            jsonData["products"].map((json) => Product.fromJson(json)));
        return products;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}

