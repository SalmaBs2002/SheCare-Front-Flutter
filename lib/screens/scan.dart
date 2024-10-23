// Import the necessary packages
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// Assume we have a classification function (to be implemented later)
Future<String> classifyImage(File image) async {
  // TODO: Add your model classification logic here
  // For now, just returning a dummy result.
  await Future.delayed(Duration(seconds: 1)); // Simulate some processing time
  return "Classification Result: Sample Result"; // Replace with actual result
}

class ImageScanPage extends StatefulWidget {
  const ImageScanPage({Key? key}) : super(key: key);

  @override
  _ImageScanPageState createState() => _ImageScanPageState();
}

class _ImageScanPageState extends State<ImageScanPage> {
  File? _image;
  String? _classificationResult; // Variable to hold the classification result
  bool _showResultContainer = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _showResultContainer = false; // Reset result display when new image is picked
      });
    }
  }

  Future<void> _scanImage() async {
    if (_image != null) {
      String result = await classifyImage(_image!); // Classify the picked image
      setState(() {
        _classificationResult = result; // Store the classification result
        _showResultContainer = true; // Show result container
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 220,
                  height: 230,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE2EF),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Center(
                      child: Image.asset(
                        'assets/scan_logo.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                if (!_showResultContainer)
                  ElevatedButton(
                    onPressed: _scanImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFB6F92),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      'Scan',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                if (_image != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.file(
                      _image!,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (_showResultContainer)
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFFFB6F92),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Résultat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 0),
                      Container(
                        width: 280,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xFFFDA1BA),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            _classificationResult ?? 'Votre résultat ici', // Display result or default message
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildBottomNavBar(context),
          ),
          Positioned(
            bottom: 15,
            left: MediaQuery.of(context).size.width / 2 - 42.5,
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
                onPressed: _pickImage, // Trigger image picking when pressed
              ),
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
        SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Color(0xFFFB6F92)),
        ),
      ],
    );
  }

  // Bottom Navigation Bar function
  Widget buildBottomNavBar(BuildContext context) {
    final List<String> navIcons = [
      'assets/home_logo.png',
      'assets/calendar_logo.png',
      'assets/exercise_logo.png',
      'assets/profile_logo.png',
    ];

    final List<String> navLabels = [
      'Home',
      'Calendar',
      'Exercise',
      'Profile',
    ];

    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: _buildNavItem(navIcons[0], navLabels[0]),
          ),
          SizedBox(width: 40),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/calendar');
            },
            child: _buildNavItem(navIcons[1], navLabels[1], iconSize: 30),
          ),
          SizedBox(width: 50),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
            child: _buildNavItem(navIcons[2], navLabels[2]),
          ),
          SizedBox(width: 40),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
            child: _buildNavItem(navIcons[3], navLabels[3]),
          ),
        ],
      ),
    );
  }
}
