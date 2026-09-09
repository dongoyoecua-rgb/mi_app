import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/inventory_provider.dart';
import '../widgets/product_card.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
      ),
      body: Consumer<InventoryProvider>(
        builder: (context, inventoryProvider, child) {
          final products = inventoryProvider.products;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCard(
                product: product,
                onFavoritePressed: () {
                  inventoryProvider.toggleFavorite(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        product.isFavorite
                            ? '${product.name} agregado a favoritos'
                            : '${product.name} eliminado de favoritos',
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}