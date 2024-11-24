import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'custom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Back Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade600, Colors.pink.shade200],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Space between Welcome Back and Reminder

            // Improved Reminder Section with Enhanced Design
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_alarm,
                      color: Colors.pink.shade600,
                      size: 32.0,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Your next scan is scheduled for 25 Nov at 10:00 AM. Please be on time for your health check.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Space after Reminder Section

            // Carousel Slider for Inspiring Stories
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0, // Height of the carousel, adjust this as needed
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0, // Ensures the items take up the full width
              ),
              items: [
                {
                  "image": "assets/story1.jpg",
                },
                {
                  "image": "assets/story2.jpg",
                },
                {
                  "image": "assets/story3.jpg",
                },
              ].map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage(item["image"]!),
                          fit: BoxFit.cover, // Makes the image cover the container area
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              item["title"] ?? "", // Ensure there's a title for each item
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center( // This centers the stat cards
                child: Wrap(
                  spacing: 25.0, // Horizontal spacing between cards
                  runSpacing: 10.0, // Vertical spacing between lines
                  children: [
                    // Stat Card 1
                    StatCard(
                      title: "Appointments",
                      value: "12",
                      icon: Icons.calendar_today,
                    ),
                    // Stat Card 2
                    StatCard(
                      title: "Completed Tests",
                      value: "5",
                      icon: Icons.check_circle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Interactive Cards with Improved Design
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  HomeCard(
                    title: "Breast Cancer Scan",
                    subtitle: "Dr. Sarah Thompson, Oncologist",
                    description:
                        "This scan is essential to monitor your breast health and ensure early detection of any issues.",
                    icon: Icons.camera_alt,
                  ),
                  SizedBox(height: 16.0),
                  HomeCard(
                    title: "Inspiring Stories",
                    description:
                        "Hear from others who have battled breast cancer and gained strength from their experiences.",
                    icon: Icons.book,
                  ),
                  SizedBox(height: 16.0),
                  HomeCard(
                    title: "Hints And Tips",
                    description:
                        "Helpful advice on staying positive and taking care of yourself during treatment.",
                    icon: Icons.lightbulb,
                  ),
                  SizedBox(height: 16.0),
                  HomeCard(
                    title: "Trusted Information",
                    description:
                        "Find reliable resources and the latest research about breast cancer.",
                    icon: Icons.info,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

// Widget for Interactive Cards
class HomeCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String description;
  final IconData icon;

  const HomeCard({
    Key? key,
    required this.title,
    this.subtitle,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 226, 239), // Set color to Colors.pink.shade50 for the card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Colors.pink.shade600, size: 40),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (subtitle != null)
              Text(
                subtitle!,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            Text(
              description,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14.0),
            ),
          ],
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );
  }
}

// Widget for Stats Section
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     const double cardHeight = 120.0;
    const double cardWidth = 150.0;
    return Container(
      height: cardHeight, // Fixed height
      width: cardWidth, // Fixed width
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 226, 239), // Updated color
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color.fromARGB(255, 230, 79, 135), size: 32),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 148, 4, 66),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(color: const Color.fromARGB(255, 129, 1, 48)),
          ),
        ],
      ),
    );
  }
}
