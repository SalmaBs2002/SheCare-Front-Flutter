import 'package:flutter/material.dart';
import 'get_started_screen.dart'; // Import the GetStarted page

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE2EF), // Pink background
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30), // Space above the image to push it down
            // Top image with rounded corners and faded effect
            Container(
              width: MediaQuery.of(context).size.width * 1.1, // Make image wider
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                      bottomRight: Radius.circular(120),
                    ),
                    child: Image.asset(
                      'assets/top_image.jpg', // Replace with your image path
                      width: double.infinity,
                      height: 300, // Increased height
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Faded overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120),
                      ),
                      color: const Color.fromARGB(255, 255, 209, 236).withOpacity(0.4), // Semi-transparent overlay
                    ),
                    height: 300,
                  ),
                  // Back arrow
                  Positioned(
                    top: 20, // Adjust the position from the top
                    right: 20, // Adjust the position from the right
                    child: GestureDetector(
                      onTap: () {
                        // Navigate back to AuthScreen
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/fleche.png', // Replace with your arrow image path
                        width: 40, // Set width of the arrow image
                        height: 40, // Set height of the arrow image
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40), // Space after the image for the text
            // Welcome back text
            Text(
              'WELCOME BACK!',
              style: TextStyle(
                fontSize: 32, // Adjust font size as needed
                color: Color(0xFFFB6F92), // Pink color
                fontWeight: FontWeight.w600, // Make it bold if desired
              ),
            ),
            SizedBox(height: 30), // Space after the text to move fields down
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Email input field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        color: Color(0xFFFB6F92), // Pink label color
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFB6F92), // Pink bottom border
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFB6F92), // Pink border when focused
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.black), // Text color
                    cursorColor: Color(0xFFFB6F92), // Pink cursor
                  ),
                  SizedBox(height: 20), // Space between fields

                  // Password input field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color(0xFFFB6F92), // Pink label color
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFB6F92), // Pink bottom border
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFB6F92), // Pink border when focused
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.black), // Text color
                    cursorColor: Color(0xFFFB6F92), // Pink cursor
                  ),
                  SizedBox(height: 40), // Space before the login button

                  // Login button
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to GetStarted page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GetStartedScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFB6F92),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
