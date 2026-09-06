import 'package:flutter/material.dart';
import '../models/product.dart';

class InventoryProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      name: 'Laptop Lenovo',
      category: 'Tecnología',
      stock: 10,
      price: 650.00,
    ),
    Product(
      name: 'Mouse Logitech',
      category: 'Accesorios',
      stock: 25,
      price: 25.00,
    ),
    Product(
      name: 'Teclado Mecánico',
      category: 'Accesorios',
      stock: 15,
      price: 45.00,
    ),
    Product(
      name: 'Monitor Samsung',
      category: 'Tecnología',
      stock: 8,
      price: 220.00,
    ),
  ];

  List<Product> get products => _products;

  List<Product> get favoriteProducts =>
      _products.where((product) => product.isFavorite).toList();

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}