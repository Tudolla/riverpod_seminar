class Product {
  final String id;
  final String title;
  final String description;
  final double price;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price});
}

final List<Product> productList = [
  Product(
      id: '1',
      title: 'Mũ đỏ',
      description: 'A red shirt - it is pretty red!',
      price: 29.99),
  Product(
      id: '2',
      title: 'Áo thun',
      description: 'A nice pair of trousers.',
      price: 59.99),
  Product(
      id: '3',
      title: 'Quần đùi',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99),
  Product(
      id: '4',
      title: 'Kính râm',
      description: 'Prepare any meal you want.',
      price: 49.99),
];
