// main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cleanup_screen.dart';
import 'screens/impact_screen.dart';
import 'screens/rewards_screen.dart';

void main() {
  runApp(DigitalCleanupApp());
}

class DigitalCleanupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoClean Digital',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: MainNavigator(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    HomeScreen(),
    CleanupScreen(),
    ImpactScreen(),
    RewardsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cleaning_services),
            label: 'Cleanup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco),
            label: 'Impact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Rewards',
          ),
        ],
      ),
    );
  }
}