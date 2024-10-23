// home_screen.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for opening URLs
import 'scan.dart'; // Import your ScanScreen

class HomeScreen extends StatelessWidget {
  final String userName = "Khadija"; // Change this to the actual user's name
  final List<Map<String, String>> activities = [
    {
      'imagePath': 'assets/inspiring_stories.png',
      'text': 'Inspiring Stories',
    },
    {
      'imagePath': 'assets/hints_tips.png',
      'text': 'Hints & Tips',
    },
    {
      'imagePath': 'assets/trusted_info.png',
      'text': 'Trusted Info',
    },
  ];

  // List of articles
  final List<Map<String, dynamic>> articles = [
    {
      'imagePath': 'assets/article1.png', // Replace with your article image path
      'title': 'Understanding Breast Cancer',
      'url': 'https://www.cancer.org/cancer/breast-cancer.html', // Link to the article
    },
    {
      'imagePath': 'assets/article2.png', // Replace with your article image path
      'title': 'Latest Research on Treatments',
      'url': 'https://example.com/article2', // Link to the article
    },
    {
      'imagePath': 'assets/article3.png', // Replace with your article image path
      'title': 'Healthy Lifestyle Tips',
      'url': 'https://example.com/article3', // Link to the article
    },
  ];

  // List of your bottom navigation bar icons
  final List<String> navIcons = [
    'assets/home_logo.png',
    'assets/calendar_logo.png',
    'assets/scan_logo.png', // Scan logo is in the middle
    'assets/exercise_logo.png',
    'assets/profile_logo.png',
  ];

  // List of navigation labels
  final List<String> navLabels = [
    'Home',
    'Calendar',
    'Scan',
    'Exercise',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home_page.png'), // Your background image
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),
          // Content on top of the background
          Padding(
            padding: const EdgeInsets.only(top: 60.0), // Keep this for bottom content spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
              children: [
                // Logo aligned to the left
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/logo_shecare2.png', // Your logo image
                    height: 50, // Adjust the size as needed
                  ),
                ),
                SizedBox(height: 0), // Space below the logo
                // Greeting Text centered at the top
                Center(
                  child: Text(
                    "What's Up $userName!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 249, 249, 249), // Change the text color if needed
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between text and carousel
                // CarouselSlider for activities
                CarouselSlider(
                  options: CarouselOptions(
                    height: 100.0, // Adjusted height of the carousel
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: activities.map((activity) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.4, // Smaller width for cards
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.pink[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                activity['imagePath']!, // Accessing image path
                                height: 60, // Increased logo size
                              ),
                              SizedBox(height: 8),
                              Text(
                                activity['text']!, // Accessing text
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, // Bold text
                                  color: const Color.fromARGB(255, 79, 12, 40), // Change color as needed
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20), // Space between carousel and image
                // Centered Image Below Carousel
                Center(
                  child: Image.asset(
                    'assets/middle.png', // Replace with your image path
                    height: 200, // Set the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
                SizedBox(height: 20), // Space between image and articles title
                // Title for Recent Articles
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Our Recent Articles",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFB6F92), // Change color as needed
                    ),
                  ),
                ),
                SizedBox(height: 10), // Space between title and articles carousel

                // CarouselSlider for articles
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150.0, // Height for articles carousel
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                  items: articles.map((article) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () => _launchURL(article['url']!),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.65, // Reduced width for article cards
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE2EF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                // Container for the image
                                Container(
                                  height: 100, // Set a fixed height for the image
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      article['imagePath']!, // Accessing article image path
                                      fit: BoxFit.cover, // Ensure the image covers the box
                                      width: double.infinity, // Fill the width of the container
                                      height: double.infinity, // Fill the height of the container
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8), // Space between image and title
                                // Title is now outside of the container
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding for the title
                                  child: Text(
                                    article['title']!, // Accessing article title
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 79, 12, 40),
                                    ),
                                    textAlign: TextAlign.center, // Center align the title
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Spacer(), // This will push the next widgets to the bottom
                // Bottom Navigation Bar with full-circle and scan icon
                Stack(
                  clipBehavior: Clip.none, // Allows the circle to be shown outside the Stack
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Navigation Bar
                    Container(
                      color: Colors.white,
                      height: 60, // Adjust the height to make the navbar smaller
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly space the icons
                        children: [
                          _buildNavItem(navIcons[0], navLabels[0]),
                          SizedBox(width: 40), // Increase spacing between icons
                          _buildNavItem(navIcons[1], navLabels[1], iconSize: 30), // Bigger calendar icon
                           SizedBox(width: 40),
                           SizedBox(width: 50),
                        
 _buildNavItem(navIcons[3], navLabels[3]), // Replace with actual index for profile icon
                          SizedBox(width: 40), // Increase spacing between icons
                          GestureDetector(
  onTap: () {
    Navigator.pushReplacementNamed(context, '/profile'); // Ensure this route matches what you registered
  },
  child: _buildNavItem(navIcons[4], navLabels[4]), // Ensure this refers to the profile icon
),
                        ],
                      ),
                    ),
                    // Circle at the center of the bottom navigation bar
                    Positioned(
                      bottom: 15, // Position the circle slightly above the bottom navigation
                      child: Container(
                        height: 75, // Height of the circle
                        width: 85, // Width of the circle
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFB6F92), // Circle color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5), // Shadow color
                              spreadRadius: 2, // Spread of the shadow
                              blurRadius: 5, // Blur radius
                              offset: Offset(0, 3), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, color: Colors.white), // Camera icon
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ImageScanPage ()), // Navigate to ScanScreen
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build navigation items
  Widget _buildNavItem(String iconPath, String label, {double iconSize = 24}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          height: iconSize,
          width: iconSize,
        ),
        SizedBox(height: 3), // Space between icon and label
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Color(0xFFFB6F92)), // Adjust the text style as needed
        ),
      ],
    );
  }

  // Function to launch URL for articles
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}