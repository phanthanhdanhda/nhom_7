  import 'package:flutter/material.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Image.asset('assets/home_tab_logo.png'), // Logo Facebook
          ),
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.chat, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Stories Section
              Container(
                height: 100,
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, // Number of stories
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: Center(child: Text('Story $index')),
                    );
                  },
                ),
              ),
              const Divider(),
              // Post Input Section
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,  // Bạn có thể thay đổi màu nền nếu cần
                      child: ClipOval(
                        child: Image.asset(
                          'assets/anhnu.png',  // Đặt đường dẫn tới ảnh bạn muốn hiển thị
                          fit: BoxFit.cover,  // Đảm bảo ảnh được bao phủ đầy trong hình tròn
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Bạn đang nghĩ gì?',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              // Posts Section
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10, // Example post count
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User $index',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  '100 phút trước',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hôm nay trời đẹp quá.',
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 200,
                          color: Colors.grey.shade300,
                          child: const Center(child: Text('Post Image')),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.thumb_up_alt_outlined),
                              label: const Text('Like'),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.comment_outlined),
                              label: const Text('Comment'),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.share_outlined),
                              label: const Text('Share'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey.shade200,
      );
    }
  }
