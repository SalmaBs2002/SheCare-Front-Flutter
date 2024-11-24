import 'package:flutter/material.dart';
import '../login_screen.dart';
import 'signup.dart'; // Ensure this is correctly defined and imported

class SignUpStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 226, 239), // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
          children: [
            SizedBox(height: 40), // Add spacing at the top

            // Centered Image
            Center(
              child: Image.asset(
                'assets/step1.png', // Ensure this image is in your assets folder
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 30),

            // Full Name Input
            _buildTextField('Full Name', false),

            SizedBox(height: 20),

            // Email Input
            _buildTextField('Email Address', false),

            SizedBox(height: 20),

            // Password Input
            _buildTextField('Password', true),

            SizedBox(height: 20),

            // Confirm Password Input
            _buildTextField('Confirm Password', true),

            SizedBox(height: 40),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next step
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUpStepsCombined()), // Ensure this page is correctly defined
                    );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Color(0xFFFB6F92),
                      fontSize: 18, // Increased font size for the button
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button background color
                    minimumSize: Size(150, 50),
                    side: BorderSide(color: Color(0xFFFB6F92)), // Border color
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Sign In Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the content
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.pink, fontSize: 12), // Smaller font size
                ),
                SizedBox(width: 5), // Add some spacing between texts
                GestureDetector(
                  onTap: () {
                    // Navigate to the login page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.pink[800],
                      decoration: TextDecoration.underline,
                      fontSize: 12, // Smaller font size
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build text fields
  Widget _buildTextField(String label, bool obscureText) {
    return Container(
      width: double.infinity, // Make the input boxes take full width
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFFFB6F92), fontSize: 14), // Smaller font size
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFB6F92)), // Change border color
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFB6F92)), // Change border color when focused
          ),
        ),
        style: TextStyle(color: Colors.grey), // Set input text color to gray
      ),
    );
  }
}
