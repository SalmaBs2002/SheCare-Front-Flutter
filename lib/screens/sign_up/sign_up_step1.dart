import 'package:flutter/material.dart';
import '../login_screen.dart';

class SignUpStep1 extends StatelessWidget {
  final VoidCallback onNext;

  SignUpStep1({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 226, 239), // Set the background color
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
        children: [
        
          // Centered Image
          Center(
            child: Image.asset(
              'assets/step1.png',
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 30),

          // Full Name Input
          Container(
            width: 300, // Make the input boxes smaller and centered
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
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
          ),
          SizedBox(height: 20),

          // Email Input
          Container(
            width: 300, // Make the input boxes smaller and centered
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
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
          ),
          SizedBox(height: 20),

          // Password Input
          Container(
            width: 300, // Make the input boxes smaller and centered
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color(0xFFFB6F92), fontSize: 14), // Smaller font size
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFB6F92)), // Change border color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFB6F92)), // Change border color when focused
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.grey), // Set input text color to gray
            ),
          ),
          SizedBox(height: 20),

          // Confirm Password Input
          Container(
            width: 300, // Make the input boxes smaller and centered
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Color(0xFFFB6F92), fontSize: 14), // Smaller font size
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFB6F92)), // Change border color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFB6F92)), // Change border color when focused
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.grey), // Set input text color to gray
            ),
          ),
          SizedBox(height: 40),

          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => onNext(),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Color(0xFFFB6F92),
                    fontSize: 18, // Keep the increased font size for the button
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(150, 50),
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
                  Navigator.push(
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
    );
  }
}
