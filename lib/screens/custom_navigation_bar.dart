import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import your HomeScreen
import 'calendar.dart'; // Import your CalendarScreen
import 'exercise.dart'; // Import your ExerciseScreen
import 'scan.dart'; // Import your ScanScreen

class CustomNavigationBar extends StatelessWidget {
  final List<String> navIcons = [
    'assets/home_logo.png',
    'assets/calendar_logo.png',
    'assets/scan_logo.png',
    'assets/exercise_logo.png',
    'assets/profile_logo.png',
  ];

  final List<String> navLabels = [
    'Home',
    'Calendar',
    'Scan',
    'Exercise',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Home button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: _buildNavItem(navIcons[0], navLabels[0]),
              ),
              SizedBox(width: 40),

              // Calendar button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/calendar');
                },
                child: _buildNavItem(navIcons[1], navLabels[1], iconSize: 30),
              ),
              SizedBox(width: 40),

              // Placeholder for spacing
              SizedBox(width: 50),

              // Exercise button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/exercise');
                },
                child: _buildNavItem(navIcons[3], navLabels[3]),
              ),
              SizedBox(width: 40),

              // Profile button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/profile');
                },
                child: _buildNavItem(navIcons[4], navLabels[4]),
              ),
            ],
          ),
        ),
        // Floating Scan Button
        Positioned(
          bottom: 15,
          child: Container(
            height: 75,
            width: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFB6F92),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageScanPage()),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String iconPath, String label, {double iconSize = 24}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          height: iconSize,
          width: iconSize,
        ),
        SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Color(0xFFFB6F92)),
        ),
      ],
    );
  }
}
