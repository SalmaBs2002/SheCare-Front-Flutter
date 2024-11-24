import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:math';
import 'custom_navigation_bar.dart'; // Import your custom navigation bar

Future<String> classifyImage(File image) async {
  await Future.delayed(Duration(seconds: 2)); // Simulate some processing time
  return Random().nextBool() ? "Malignant" : "Benign"; 
}

class ImageScanPage extends StatefulWidget {
  const ImageScanPage({Key? key}) : super(key: key);

  @override
  _ImageScanPageState createState() => _ImageScanPageState();
}

class _ImageScanPageState extends State<ImageScanPage> {
  File? _image;
  String? _classificationResult;
  bool _showResultContainer = false;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _showResultContainer = false;
        _classificationResult = null;
        _errorMessage = null;
      });
    }
  }

  Future<void> _scanImage() async {
    if (_image == null) {
      setState(() {
        _errorMessage = 'You must upload a picture';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _classificationResult = null;
    });

    String result = await classifyImage(_image!);

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _classificationResult = result;
      _showResultContainer = true;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/home_page.png',
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
          ),
          // Foreground Content
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
                      child: _image != null
                          ? Image.file(
                              _image!,
                              width: 220,
                              height: 230,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/scan_logo.png',
                              width: 50,
                              height: 50,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ElevatedButton(
                  onPressed: _scanImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFB6F92),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: _isLoading
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Analyzing the image...',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        )
                      : Text(
                          'Scan',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
                            _classificationResult ?? 'Votre résultat ici',
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
            child: CustomNavigationBar(),
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
              ),
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.white),
                onPressed: _pickImage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
