import 'package:flutter/material.dart';
import 'screens/tan.dart';
import 'screens/tuan.dart';
import 'screens/nguyen.dart';
import 'screens/hieu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        // More modern, slightly desaturated green:
        primaryColor:
            const Color(0xFF00c853), // Use hex color for precise color
        scaffoldBackgroundColor: const Color(0xFF121212), // Darker background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212), // Match AppBar with background
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Color(0xFF00c853)), // Modern green
        ),
        // Customize text styles for better contrast
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(color: Colors.grey[300]), // Slightly lighter text
          bodyMedium: TextStyle(color: Colors.grey[400]),
          titleMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          // ... other text styles
        ),
        // Modern green for buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00c853),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: 30), // Add padding
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        // Bottom navigation bar with a slightly lighter background
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF181818),
          selectedItemColor: Color(0xFF00c853),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
        // Circular progress indicator
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF00c853),
        ),
      ),
      title: 'Bottom Nav App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    TuanScreen(key: ValueKey('tuan_screen')),
    TanScreen(key: ValueKey('tan_screen')),
    NguyenScreen(key: ValueKey('nguyen_screen')),
    HieuScreen(key: ValueKey('hieu_screen')),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Make all items visible
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.run_circle),
            label: 'Chay bo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Buoc chan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Thong bao',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Tro chuyen',
          ),
        ],
      ),
    );
  }
}
