class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String description;
  final String category;
  final double rating;
  final int ratingCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
    required this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      description: json['description'],
      category: json['category'] ?? '',
      rating: (json['rating']?['rate'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (json['rating']?['count'] as num?)?.toInt() ?? 0,
    );
  }
}
