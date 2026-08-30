class Product {
  final String name;
  final String category;
  int stock;
  final double price;
  bool isFavorite;

  Product({
    required this.name,
    required this.category,
    required this.stock,
    required this.price,
    this.isFavorite = false,
  });
}