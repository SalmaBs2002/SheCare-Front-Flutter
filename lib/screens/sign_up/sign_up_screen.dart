import 'package:flutter/material.dart';
import 'sign_up_step1.dart';
import 'sign_up_step2.dart';
import 'sign_up_step3.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentStep = 0; // Track the current step

  // Initialize steps in the sign-up process
  List<Widget> _steps = [];

  @override
  void initState() {
    super.initState();
    _steps = [
      SignUpStep1(onNext: _goToNextStep),
      SignUpStep2(onNext: _goToNextStep, onBack: _goToPreviousStep),
      SignUpStep3(onBack: _goToPreviousStep),
    ];
  }

  // Method to go to the next step
  void _goToNextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Handle final submission here if needed
      print("Sign up completed!");
    }
  }

  // Method to go to the previous step
  void _goToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 255, 226, 239),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40), // Optional spacing from the top
          
          // Row for logo and stepper
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0), // Adjust left padding if needed
                child: Align(
                  alignment: Alignment.topLeft, // Align the logo to the top left
                  child: Image.asset(
                    'assets/logo_shecare2.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              SizedBox(width: 10), // Spacing between logo and stepper
              
              // Stepper section
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  margin: const EdgeInsets.only(left: 60), // Add margin to move stepper left
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align stepper items to the start
                    children: List.generate(_steps.length, (index) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: _currentStep >= index
                                      ? const Color.fromARGB(255, 251, 111, 146)
                                      : const Color.fromARGB(255, 253, 161, 186),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(height: 4), // Spacing between circle and text
                            ],
                          ),
                          // Add spacing between dots
                          if (index < _steps.length - 1) SizedBox(width: 20),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          
          // Show the current step widget
          _steps[_currentStep],
        ],
      ),
    ),
  );
}


}