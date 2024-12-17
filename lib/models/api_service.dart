import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:5000/api/posts';

  Future<List<dynamic>> searchPosts(String keyword) async {
    final response = await http.get(Uri.parse('$baseUrl/search?keyword=$keyword'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Trả về danh sách bài viết
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
