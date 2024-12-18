import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nhom_7/models/api_url.dart';
import 'package:nhom_7/models/productPost.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  List<productPost> _products = []; // Danh sách sản phẩm
  bool _isLoading = false; // Trạng thái loading

  @override
  void initState() {
    super.initState();
    _fetchProducts(); // Gọi API khi load màn hình lần đầu
  }

  // Hàm fetch sản phẩm hoặc tìm kiếm
  Future<void> _fetchProducts({String? query}) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final baseUrl = ApiString.url + "/api/ProductApi";
      final url = query != null && query.isNotEmpty
          ? '$baseUrl/search?query=$query'
          : baseUrl;

      // In log URL để kiểm tra
      print('Requesting URL: $url');

      final response = await http.get(Uri.parse(url));
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _products = data.map((item) => productPost.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
      setState(() {
        _products = [];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Hàm xử lý khi người dùng tìm kiếm
  void _onSearch(String query) {
    _fetchProducts(query: query); // Gọi API tìm kiếm
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Screen'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _onSearch, // Gọi hàm tìm kiếm khi nhập từ khóa
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Hiển thị khi đang tải
          : _products.isEmpty
              ? const Center(
                  child: Text('No products found.')) // Khi không có dữ liệu
              : ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return ListTile(
                      leading: product.image != null &&
                              product.image!.isNotEmpty
                          ? Image.network(
                              product.image!,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.image),
                            )
                          : Icon(Icons.image), // Icon mặc định nếu không có ảnh
                      title: Text(product.name ?? 'No Name'),
                      subtitle: Text(product.description ?? 'No Description'),
                      trailing: Text('${product.price ?? 0} VND'),
                    );
                  },
                ),
    );
  }
}
