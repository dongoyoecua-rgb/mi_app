import 'package:flutter/material.dart';

import '../models/product.dart';
import 'favorite_button.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoritePressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.inventory_2),
        ),
        title: Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${product.category}\n'
          'Stock: ${product.stock} | '
          'Precio: \$${product.price.toStringAsFixed(2)}',
        ),
        isThreeLine: true,
        trailing: FavoriteButton(
          isFavorite: product.isFavorite,
          onPressed: onFavoritePressed,
        ),
      ),
    );
  }
}