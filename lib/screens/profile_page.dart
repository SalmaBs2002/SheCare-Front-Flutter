import 'package:flutter/material.dart';
import 'scan.dart';
import 'custom_navigation_bar.dart'; // Import your CustomNavigationBar

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
      body: Stack(
        children: [
          // Adjusted background image
          Positioned(
            top: 50, // Lower the image by 50 pixels
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/home_page.png', // Your background image
              fit: BoxFit.cover, // Ensures it covers the whole screen
            ),
          ),
          // Content over the background
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileHeader(), // Profile header
                  const SizedBox(height: 30), // Space between header and content
                  _buildDataContainer(), // Data container
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(), // Use your custom navigation bar
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFDA1BA).withOpacity(0.8), // Semi-transparent header
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Semi-transparent container
        borderRadius: BorderRadius.circular(20),
      ),
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
}
