import 'package:flutter/material.dart';
import 'package:nhom_7/screens/video_list_screen.dart';
import 'home_screen.dart';
import 'video_screen.dart';  // Import VideoScreen
import 'account_screen.dart';
import 'market_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<String> _videoAssets = [
    '/sample_video.mp4',
    '/siu.mp4',
  ];

  // List of screens (you might need to modify this based on your logic)
  final List<Widget> _screens = [
    const HomeScreen(),
    // Modify this to use VideoScreen and pass a video asset
    const VideoListScreen(),
    const AccountScreen(),
    const MarketScreen(),
  ];

  // Custom function to change the active and inactive colors for the BottomNavigationBar
  Color _getIconColor(int index) {
    return _currentIndex == index ? Colors.blue : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _getIconColor(0)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library, color: _getIconColor(1)),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: _getIconColor(2)),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: _getIconColor(3)),
            label: 'Market',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 10,
      ),
    );
  }
}