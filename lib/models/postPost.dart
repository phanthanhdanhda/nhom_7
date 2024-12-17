class postPost {
  final int id;
  final String content;
  final String image;
  final String createdAt;

  postPost({
    required this.id,
    required this.content,
    required this.image,
    required this.createdAt,
  });

  // Factory để chuyển JSON thành đối tượng Dart
  factory postPost.fromJson(Map<String, dynamic> json) {
    return postPost(
      id: json['id'] ?? 0,
      content: json['content'] ?? '',
      image: json['image'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}