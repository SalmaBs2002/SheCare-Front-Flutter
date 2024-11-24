import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/scan.dart';
import 'screens/profile_page.dart';
import 'screens/calendar.dart'; // CalendarScreen
import 'screens/exercise.dart'; // ExerciseScreen


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
         '/exercise': (context) => ExerciseScreen(),
            '/calendar': (context) => CalendarScreen(),
      },
    );
  }
}
