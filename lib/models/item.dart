class Item {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      image: json['image'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
