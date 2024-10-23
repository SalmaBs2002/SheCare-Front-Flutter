import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the LoginScreen
import 'sign_up/sign_up_screen.dart'; // Import the SignUpScreen

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE2EF), // Pink background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Image.asset(
              'assets/logo_shecare.png',
              height: 350, // Size of the logo
              width: 350,
            ),
            SizedBox(height: 20), // Space between logo and buttons

            // Sign Up button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFB6F92), // Background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 18), // Button text size
              ),
            ),
            SizedBox(height: 20), // Space between buttons

            // Login button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
                foregroundColor: Color(0xFFFB6F92), // Text color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18), // Button text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
