import '../models/product.dart';
import '../services/api_service.dart';

class ProductViewModel {
  Future<List<Product>> getProducts() {
    return ApiService.fetchProducts();
  }

  List<String> getCategories(List<Product> products) {
    final cats = products.map((p) => p.category).toSet().toList();
    cats.sort();
    return ['Tümü', ...cats];
  }

  List<Product> filterProducts(
    List<Product> products, {
    String query = '',
    String category = 'Tümü',
  }) {
    return products.where((p) {
      final matchQuery =
          query.isEmpty ||
          p.title.toLowerCase().contains(query.toLowerCase()) ||
          p.category.toLowerCase().contains(query.toLowerCase());
      final matchCategory = category == 'Tümü' || p.category == category;
      return matchQuery && matchCategory;
    }).toList();
  }
}
