import 'package:flutter/material.dart';
import '../models/product.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final List<Product> products = [
    Product(
      name: 'Laptop Lenovo',
      category: 'Tecnología',
      stock: 8,
      price: 650.00,
    ),
    Product(
      name: 'Mouse inalámbrico',
      category: 'Accesorios',
      stock: 25,
      price: 18.50,
    ),
    Product(
      name: 'Teclado mecánico',
      category: 'Accesorios',
      stock: 15,
      price: 45.00,
    ),
    Product(
      name: 'Monitor 24 pulgadas',
      category: 'Tecnología',
      stock: 10,
      price: 180.00,
    ),
    Product(
      name: 'Cable HDMI',
      category: 'Accesorios',
      stock: 40,
      price: 8.50,
    ),
  ];

  void toggleFavorite(int index) {
    setState(() {
      products[index].isFavorite = !products[index].isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          products[index].isFavorite
              ? '${products[index].name} agregado a favoritos'
              : '${products[index].name} eliminado de favoritos',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            key: ValueKey(product.name),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: const Icon(
                  Icons.inventory_2,
                  color: Colors.indigo,
                ),
              ),
              title: Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${product.category}\n'
                'Stock: ${product.stock} | \$${product.price.toStringAsFixed(2)}',
              ),
              isThreeLine: true,
              trailing: IconButton(
                onPressed: () => toggleFavorite(index),
                icon: Icon(
                  product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: product.isFavorite
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}