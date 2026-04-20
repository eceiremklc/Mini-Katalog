import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final bool isInCart;
  final VoidCallback onCartToggle;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.isInCart,
    required this.onCartToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.06),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Görsel alanı
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: const Color(0xFFF8F8F6),
                      padding: const EdgeInsets.all(16),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 48,
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                    ),
                    // Sepet butonu
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onCartToggle,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: isInCart
                                ? const Color(0xFF2563EB)
                                : Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(
                            isInCart
                                ? Icons.shopping_bag
                                : Icons.shopping_bag_outlined,
                            size: 16,
                            color: isInCart
                                ? Colors.white
                                : const Color(0xFF2563EB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Kategori etiketi
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    product.category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: Color(0xFF2563EB),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // Bilgi alanı
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 6),
                child: Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D2D2D),
                    height: 1.4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 12,
                      color: Color(0xFFF5A623),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      product.rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF888888),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2563EB),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
