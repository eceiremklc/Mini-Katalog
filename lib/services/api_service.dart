import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com/products';

  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('API Hatası: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Bağlantı hatası: $e');
    }
  }
}
