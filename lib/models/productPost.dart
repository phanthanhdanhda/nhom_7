class productPost {
  final int id;
  final String? name; // Cho phép null
  final String? description;
  final double? price;
  final String? image;

  productPost({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.image,
  });

  factory productPost.fromJson(Map<String, dynamic> json) {
    return productPost(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown Name', // Giá trị mặc định nếu null
      description: json['description'] ?? 'No description available',
      price: json['price'] != null ? json['price'].toDouble() : 0.0,
      image: json['image'], // Giữ null nếu không có giá trị
    );
  }
}
