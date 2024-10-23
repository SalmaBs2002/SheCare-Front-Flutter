import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'screens/auth_screen.dart';
import 'screens/login_screen.dart'; // Import LoginScreen
import 'screens/sign_up/sign_up_screen.dart'; // Import SignUpScreen
import 'screens/home_screen.dart';
import 'screens/scan.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => AuthScreen(),
        '/': (context) => ImageScanPage(), // The initial route
        '/home': (context) => HomeScreen(), // Define the route to HomeScreen
        
       '/profile': (context) => ProfilePage(),
      },
    );
  }
}



