import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import your home screen

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to the home screen after 3 seconds
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/get_start.png'), // Replace with your image path
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
            // Add some top padding to shift the image slightly upwards
            padding: EdgeInsets.only(top: 20), // Adjust this value as needed
          ),
          // Main content
          Center( // Center the entire content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center all content vertically
              children: [
                // Centered Image
                Image.asset(
                  'assets/start.png', // Replace with your image path
                  width: 300, // Adjust the size as needed
                  height: 300,
                ),
                SizedBox(height: 20), // Spacing between image and text

                // Welcome text
                Text(
                  'Welcome to SheCare+',
                  style: TextStyle(
                    fontSize: 29, // Font size
                    fontWeight: FontWeight.bold, // Normal text
                    color: Color.fromARGB(255, 255, 87, 129), // Customize text color
                  ),
                ),

                // Spacer to push the "Let's Get Started!" text lower
                SizedBox(height: 200), // Additional spacing before the bottom text
                
                // Main title text styled like a button
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Padding inside the "button"
                  decoration: BoxDecoration(
                    color: Color(0xFFFB6F92), // Background color (pink)
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  child: Text(
                    'Let\'s Get Started!',
                    style: TextStyle(
                      fontSize: 24, // Font size
                      fontWeight: FontWeight.bold, // Bold text
                      color: Colors.white, // Font color (white)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
