import 'package:flutter/material.dart';

class SignUpStep2 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  SignUpStep2({required this.onNext, required this.onBack});

  @override
  _SignUpStep2State createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  int? age;
  bool? isCancerFighter;
  String? cancerStage;
  String? treatment;
  bool? hasFamilyHistory;
  List<String> lifestyleRiskFactors = [];
  bool? gettingRegularCheckups;
  DateTime? lastMammographyDate;

  final List<String> stages = [
    "Stage 0",
    "Stage I",
    "Stage II",
    "Stage III",
    "Stage IV",
  ];

  final List<String> treatments = [
    "Radiation",
    "Chemotherapy",
    "Surgery",
    "Hormonal Therapy",
  ];

  final Color customColor = Color(0xFFE46C7E); // Custom color
  final Color greyColor = const Color.fromARGB(255, 137, 133, 133); // Grey color for inputs
  final Color pinkColor = Color(0xFFFB6F92); // Pink color for checkboxes

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Age Input
          Text(
            'What’s your age?',
            style: TextStyle(fontSize: 14, color: customColor),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Age',
              labelStyle: TextStyle(color: greyColor),
            ),
            onChanged: (value) {
              age = int.tryParse(value);
            },
            style: TextStyle(color: greyColor),
          ),
          SizedBox(height: 20),

          // Cancer Fighter Question
          Text(
            'Are you a cancer fighter?',
            style: TextStyle(fontSize: 14, color: customColor),
          ),
          Row(
            children: [
              Radio(
                value: true,
                groupValue: isCancerFighter,
                onChanged: (value) {
                  setState(() {
                    isCancerFighter = value as bool?;
                  });
                },
                activeColor: greyColor,
              ),
              Text('Yes', style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 137, 133, 133))),
              Radio(
                value: false,
                groupValue: isCancerFighter,
                onChanged: (value) {
                  setState(() {
                    isCancerFighter = value as bool?;
                  });
                },
                activeColor: greyColor,
              ),
              Text('No', style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 137, 133, 133))),
            ],
          ),

          // Additional Questions for Cancer Fighters
          if (isCancerFighter == true) ...[
            // Cancer Stage
            Text(
              'In which stage are you?',
              style: TextStyle(fontSize: 14, color: customColor),
            ),
            DropdownButton<String>(
              value: cancerStage,
              hint: Text('Select stage'),
              items: stages.map((stage) {
                return DropdownMenuItem(
                  value: stage,
                  child: Text(stage),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  cancerStage = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Treatment
            Text(
              'In which treatment are you?',
              style: TextStyle(fontSize: 14, color: customColor),
            ),
            DropdownButton<String>(
              value: treatment,
              hint: Text('Select treatment'),
              items: treatments.map((treatmentOption) {
                return DropdownMenuItem(
                  value: treatmentOption,
                  child: Text(treatmentOption),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  treatment = value;
                });
              },
            ),
            SizedBox(height: 20),
          ],

          // Family History
          Text(
            'Do you have a family history of breast cancer?',
            style: TextStyle(fontSize: 14, color: customColor),
          ),
          Row(
            children: [
              Radio(
                value: true,
                groupValue: hasFamilyHistory,
                onChanged: (value) {
                  setState(() {
                    hasFamilyHistory = value as bool?;
                  });
                },
                activeColor: const Color.fromARGB(255, 137, 133, 133),
              ),
              Text('Yes', style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 137, 133, 133))),
              Radio(
                value: false,
                groupValue: hasFamilyHistory,
                onChanged: (value) {
                  setState(() {
                    hasFamilyHistory = value as bool?;
                  });
                },
                activeColor: const Color.fromARGB(255, 137, 133, 133),
              ),
              Text('No', style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 137, 133, 133))),
            ],
          ),
          SizedBox(height: 20),

          // Lifestyle Risk Factors
          Text(
            'Does your lifestyle include known risk factors for breast cancer?',
            style: TextStyle(fontSize: 14, color: customColor),
          ),
          Column(
            children: [
              CheckboxListTile(
                title: Text('Alcohol', style: TextStyle(fontSize: 14, color : const Color.fromARGB(255, 137, 133, 133))),
                value: lifestyleRiskFactors.contains('Alcohol'),
                activeColor: pinkColor, // Set checkbox active color to pink
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      lifestyleRiskFactors.add('Alcohol');
                    } else {
                      lifestyleRiskFactors.remove('Alcohol');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Smoking', style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 137, 133, 133))),
                value: lifestyleRiskFactors.contains('Smoking'),
                activeColor: pinkColor, // Set checkbox active color to pink
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      lifestyleRiskFactors.add('Smoking');
                    } else {
                      lifestyleRiskFactors.remove('Smoking');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Low Physical Activity', style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 137, 133, 133))),
                value: lifestyleRiskFactors.contains('Low Physical Activity'),
                activeColor: pinkColor, // Set checkbox active color to pink
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      lifestyleRiskFactors.add('Low Physical Activity');
                    } else {
                      lifestyleRiskFactors.remove('Low Physical Activity');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('None', style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 137, 133, 133))),
                value: lifestyleRiskFactors.isEmpty,
                activeColor: pinkColor, // Set checkbox active color to pink
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      lifestyleRiskFactors.clear();
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),

          // Regular Checkups (You can add this section similarly)

          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.onBack();
                },
                child: Text(
                  'Back',
                  style: TextStyle(color: Color(0xFFFB6F92)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onNext();
                },
                child: Text(
                  'Next',
                  style: TextStyle(color: Color(0xFFFB6F92)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
