import 'package:flutter/material.dart';
import 'scan.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDropdownOpen = false;

  final List<String> medicalHistories = [
    'None',
    'Diabetes',
    'Hypertension',
    'Heart Disease',
    'Cancer',
    'Other',
  ];

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(), // Profile header
          const SizedBox(height: 30), // Space between header and content
          _buildDataContainer(), // Data container
        ],
      ),
    ),
    bottomNavigationBar: buildBottomNavBar(context), // Bottom navigation bar
    floatingActionButton: _buildFloatingActionButton(context), // Floating action button
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Position the button
  );
}


  Widget _buildProfileHeader() {
    return Container(
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFDA1BA),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(66)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 50,
              color: Color(0xFFFDA1BA),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Khadija Ben Ali',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              // Edit logic here
              print('Edit button pressed');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDataContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Column(
        children: [
          _buildProfileLine(
            icon: Icons.email,
            value: 'khadija@example.com',
            iconColor: Color(0xFFFDA1BA),
          ),
          _buildProfileLine(
            icon: Icons.lock,
            value: '••••••••',
            iconColor: Color(0xFFFDA1BA),
          ),
          _buildMedicalHistoryLine(),
          _buildProfileLine(
            icon: Icons.notifications,
            value: 'Enabled',
            iconColor: Color(0xFFFDA1BA),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileLine({
    required IconData icon,
    required String value,
    Color iconColor = Colors.grey,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(87, 86, 86, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xFFFDA1BA),
          thickness: 2,
        ),
      ],
    );
  }

  Widget _buildMedicalHistoryLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isDropdownOpen = !isDropdownOpen;
              });
            },
            child: Row(
              children: [
                Icon(Icons.medical_services, color: Color(0xFFFDA1BA)),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Medical History',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(87, 86, 86, 1),
                    ),
                  ),
                ),
                Icon(
                  isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Color(0xFFFDA1BA),
                ),
              ],
            ),
          ),
          if (isDropdownOpen)
            Column(
              children: medicalHistories.map((history) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          history,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(62, 62, 62, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          Divider(
            color: Color(0xFFFDA1BA),
            thickness: 2,
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
      'assets/profile_logo.png', // Profile icon path
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
              // Navigate to Home Screen
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: _buildNavItem(navIcons[0], navLabels[0]),
          ),
          SizedBox(width: 40),
          GestureDetector(
            onTap: () {
              // Navigate to Calendar Screen
              Navigator.pushReplacementNamed(context, '/calendar');
            },
            child: _buildNavItem(navIcons[1], navLabels[1], iconSize: 30),
          ),
          SizedBox(width: 40),
          SizedBox(width: 50), // Increased spacing for the scan button
          GestureDetector(
            onTap: () {
              // Navigate to Settings Screen
              Navigator.pushReplacementNamed(context, '/settings');
            },
            child: _buildNavItem(navIcons[2], navLabels[2]),
          ),
          SizedBox(width: 40),
          _buildNavItem(navIcons[3], navLabels[3]),
        ],
      ),
    );
  }

  // Floating Action Button
  Widget _buildFloatingActionButton(BuildContext context) {
  return Positioned(
    bottom: 100, // Increased value to lower the button
    left: MediaQuery.of(context).size.width / 2 - 42.5, // Center the button
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
            MaterialPageRoute(builder: (context) => ImageScanPage()), // Navigate to ScanScreen
          );
        },
      ),
    ),
  );
}
}