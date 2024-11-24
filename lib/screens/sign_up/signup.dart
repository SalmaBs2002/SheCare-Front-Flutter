import 'package:flutter/material.dart';
import '../get_started_screen.dart';
import 'sign_up_step1.dart';

class SignUpStepsCombined extends StatefulWidget {
  @override
  _SignUpStepsCombinedState createState() => _SignUpStepsCombinedState();
}

class _SignUpStepsCombinedState extends State<SignUpStepsCombined> {
  // Variables
  DateTime? dateOfBirth;
  bool? isCancerFighter;
  String? cancerStage;
  String? treatmentType;
  bool? hasFamilyHistory;
  List<String> riskFactors = [];
  bool? gettingRegularCheckups;
  DateTime? lastCheckupDate; // New variable for last checkup date
  bool? subscribeHealthTips;
  bool acceptedTerms = false;

  // New Variables for the changes in breasts and motherhood questions
  bool? noticeChangesInBreasts;
  String? changesDescription;
  bool? isMother;
  bool? breastfed;

  final List<String> cancerStages = [
    'Stage 0',
    'Stage 1',
    'Stage 2',
    'Stage 3',
    'Stage 4',
  ];

  final List<String> treatments = [
    'Chemotherapy',
    'Radiation',
    'Surgery',
    'Hormone therapy',
    'Targeted therapy',
  ];

  final List<String> lifestyleFactors = [
    'Smoking',
    'Low physical activity',
    'Alcohol',
    'None',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add top space here
              SizedBox(height: 50), // Add this line for top space

              // Date of Birth
              Text(
                'What is your date of birth?',
                style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'YYYY-MM-DD',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.calendar_today, color: Color(0xFFFB6F92)),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: dateOfBirth ?? DateTime(1990),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dateOfBirth = pickedDate;
                    });
                  }
                },
                controller: TextEditingController(
                  text: dateOfBirth != null
                      ? dateOfBirth!.toLocal().toString().split(' ')[0]
                      : '',
                ),
              ),
              SizedBox(height: 20),

              // Cancer Fighter
              Text(
                'Are you a cancer fighter?',
                style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isCancerFighter,
                    onChanged: (value) {
                      setState(() {
                        isCancerFighter = value;
                        cancerStage = null;
                        treatmentType = null;
                      });
                    },
                  ),
                  Text('Yes', style: TextStyle(color: Colors.grey)),
                  Radio<bool>(
                    value: false,
                    groupValue: isCancerFighter,
                    onChanged: (value) {
                      setState(() {
                        isCancerFighter = value;
                      });
                    },
                  ),
                  Text('No', style: TextStyle(color: Colors.grey)),
                ],
              ),
              if (isCancerFighter == true) ...[
                SizedBox(height: 10),
                Text(
                  'Which stage are you at?',
                  style: TextStyle(fontSize: 14, color: Color(0xFFFB6F92)),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: cancerStage,
                  hint: Text('Select Stage'),
                  onChanged: (value) {
                    setState(() {
                      cancerStage = value;
                    });
                  },
                  items: cancerStages
                      .map((stage) => DropdownMenuItem(
                            value: stage,
                            child: Text(stage),
                          ))
                      .toList(),
                ),
                SizedBox(height: 10),
                Text(
                  'What type of treatment are you receiving?',
                  style: TextStyle(fontSize: 14, color: Color(0xFFFB6F92)),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: treatmentType,
                  hint: Text('Select Treatment'),
                  onChanged: (value) {
                    setState(() {
                      treatmentType = value;
                    });
                  },
                  items: treatments
                      .map((treatment) => DropdownMenuItem(
                            value: treatment,
                            child: Text(treatment),
                          ))
                      .toList(),
                ),
              ],
              SizedBox(height: 20),

              // Family History
              Text(
                'Do you have a family history of breast cancer?',
                style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: hasFamilyHistory,
                    onChanged: (value) {
                      setState(() {
                        hasFamilyHistory = value;
                      });
                    },
                  ),
                  Text('Yes', style: TextStyle(color: Colors.grey)),
                  Radio<bool>(
                    value: false,
                    groupValue: hasFamilyHistory,
                    onChanged: (value) {
                      setState(() {
                        hasFamilyHistory = value;
                      });
                    },
                  ),
                  Text('No', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 20),

              // Lifestyle Factors
              Text(
                'Does your lifestyle include known risk factors for breast cancer?',
                style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
              ),
              ...lifestyleFactors.map((factor) {
                return CheckboxListTile(
                  title: Text(factor, style: TextStyle(color: Colors.grey)),
                  value: riskFactors.contains(factor),
                  onChanged: (value) {
                    setState(() {
                      if (factor == 'None') {
                        if (value == true) {
                          riskFactors.clear(); // Clear all selected options
                        }
                        riskFactors.add('None'); // Add "None"
                      } else {
                        riskFactors.remove('None'); // Remove "None" if other options are selected
                        if (value == true) {
                          riskFactors.add(factor);
                        } else {
                          riskFactors.remove(factor);
                        }
                      }
                    });
                  },
                );
              }).toList(),
              SizedBox(height: 20),

              // Regular Checkups
              Text(
                'Are you getting regular checkups?',
                style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: gettingRegularCheckups,
                    onChanged: (value) {
                      setState(() {
                        gettingRegularCheckups = value;
                      });
                    },
                  ),
                  Text('Yes', style: TextStyle(color: Colors.grey)),
                  Radio<bool>(
                    value: false,
                    groupValue: gettingRegularCheckups,
                    onChanged: (value) {
                      setState(() {
                        gettingRegularCheckups = value;
                        lastCheckupDate = null; // Reset date if "No"
                      });
                    },
                  ),
                  Text('No', style: TextStyle(color: Colors.grey)),
                ],
              ),
              if (gettingRegularCheckups == true) ...[
                SizedBox(height: 20),
                Text(
                  'When was your last checkup?',
                  style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'YYYY-MM-DD',
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.calendar_today, color: Color(0xFFFB6F92)),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: lastCheckupDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        lastCheckupDate = pickedDate;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: lastCheckupDate != null
                        ? lastCheckupDate!.toLocal().toString().split(' ')[0]
                        : '',
                  ),
                ),
              ],
              SizedBox(height: 20),

              // Did you notice any changes in your breasts?
              Text(
                'Did you notice any changes in your breasts?',
                style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: noticeChangesInBreasts,
                    onChanged: (value) {
                      setState(() {
                        noticeChangesInBreasts = value;
                      });
                    },
                  ),
                  Text('Yes', style: TextStyle(color: Colors.grey)),
                  Radio<bool>(
                    value: false,
                    groupValue: noticeChangesInBreasts,
                    onChanged: (value) {
                      setState(() {
                        noticeChangesInBreasts = value;
                      });
                    },
                  ),
                  Text('No', style: TextStyle(color: Colors.grey)),
                ],
              ),
              if (noticeChangesInBreasts == true) ...[
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      changesDescription = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Describe the changes',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              SizedBox(height: 20),

              // Are you a mother?
              Text(
                'Are you a mother?',
                style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isMother,
                    onChanged: (value) {
                      setState(() {
                        isMother = value;
                      });
                    },
                  ),
                  Text('Yes', style: TextStyle(color: Colors.grey)),
                  Radio<bool>(
                    value: false,
                    groupValue: isMother,
                    onChanged: (value) {
                      setState(() {
                        isMother = value;
                      });
                    },
                  ),
                  Text('No', style: TextStyle(color: Colors.grey)),
                ],
              ),
              if (isMother == true) ...[
                SizedBox(height: 10),
                Text(
                  'Did you breastfeed?',
                  style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
                ),
                Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: breastfed,
                      onChanged: (value) {
                        setState(() {
                          breastfed = value;
                        });
                      },
                    ),
                    Text('Yes', style: TextStyle(color: Colors.grey)),
                    Radio<bool>(
                      value: false,
                      groupValue: breastfed,
                      onChanged: (value) {
                        setState(() {
                          breastfed = value;
                        });
                      },
                    ),
                    Text('No', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
              SizedBox(height: 20),

              // Subscribe to Health Tips
              Text(
                'Would you like to subscribe to health tips?',
                style: TextStyle(fontSize: 16, color: Color(0xFFFB6F92)),
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: subscribeHealthTips,
                    onChanged: (value) {
                      setState(() {
                        subscribeHealthTips = value;
                      });
                    },
                  ),
                  Text('Yes', style: TextStyle(color: Colors.grey)),
                  Radio<bool>(
                    value: false,
                    groupValue: subscribeHealthTips,
                    onChanged: (value) {
                      setState(() {
                        subscribeHealthTips = value;
                      });
                    },
                  ),
                  Text('No', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 20),

              // Terms and Conditions
              Row(
                children: [
                  Checkbox(
                    value: acceptedTerms,
                    onChanged: (value) {
                      setState(() {
                        acceptedTerms = value ?? false;
                      });
                    },
                  ),
                  Text(
                    'I accept the terms and conditions',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpStep1()),
                        );
                      },
                      child: Text('Back', style: TextStyle(color: Color(0xFFFB6F92))),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: acceptedTerms
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GetStartedScreen()),
                              );
                            }
                          : null,
                      child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFB6F92)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}  