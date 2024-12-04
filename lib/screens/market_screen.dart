import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách sản phẩm
    List<Map<String, String>> products = [
      {
        'image': 'assets/xedap.png', // Hình ảnh của sản phẩm
        'name': 'Xe đạp thể thao', // Tên sản phẩm
        'description': 'Xe đạp cho người yêu thể thao', // Mô tả sản phẩm
        'price': '\$150', // Giá sản phẩm
      },
      {
        'image': 'assets/smartphone.png', // Hình ảnh sản phẩm khác
        'name': 'Điện thoại thông minh',
        'description': 'Điện thoại với camera sắc nét',
        'price': '\$500',
      },
      {
        'image': 'assets/laptop.png',
        'name': 'Laptop gaming',
        'description': 'Laptop mạnh mẽ cho game thủ',
        'price': '\$1200',
      },
      {
        'image': 'assets/ao.png', // Đảm bảo hình ảnh tồn tại ở đây
        'name': 'Quần áo',
        'description': 'Đẹp, thoải mái',
        'price': '\$50',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,  // Hiển thị 3 sản phẩm mỗi hàng
          crossAxisSpacing: 10,  // Khoảng cách giữa các cột
          mainAxisSpacing: 10,  // Khoảng cách giữa các hàng
        ),
        itemCount: products.length, // Số lượng sản phẩm trong danh sách
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hình ảnh sản phẩm
                Container(
                  width: double.infinity, // Đảm bảo chiều rộng đầy đủ
                  height: 400, // Tăng chiều cao để hình ảnh lớn hơn
                  child: Image.asset(
                    products[index]['image']!,
                    fit: BoxFit.contain,  // Đảm bảo hình ảnh không bị cắt
                  ),
                ),
                const SizedBox(height: 10),
                // Tên sản phẩm
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    products[index]['name']!,  // Tên sản phẩm
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                // Mô tả sản phẩm
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    products[index]['description']!,  // Mô tả sản phẩm
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 5),
                // Giá sản phẩm
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    products[index]['price']!,  // Giá sản phẩm
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
