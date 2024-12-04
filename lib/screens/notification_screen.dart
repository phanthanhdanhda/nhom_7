import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = List.generate(
      10,
          (index) => 'Notification #$index: This is a sample notification.',
    );

    return Scaffold(
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(notifications[index]),
            subtitle: const Text('Just now'),
            onTap: () {
              // Xử lý khi người dùng nhấn vào thông báo
              print('Tapped on ${notifications[index]}');
            },
          );
        },
      ),
    );
  }
}
