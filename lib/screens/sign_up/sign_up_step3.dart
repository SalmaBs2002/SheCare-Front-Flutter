import 'package:flutter/material.dart';
import '../get_started_screen.dart'; // Import your GetStartedScreen

class SignUpStep3 extends StatefulWidget {
  final VoidCallback onBack;

  SignUpStep3({required this.onBack});

  @override
  _SignUpStep3State createState() => _SignUpStep3State();
}

class _SignUpStep3State extends State<SignUpStep3> {
  bool? hasBreastChange;
  String? breastChangeDetail;
  bool? isMother;
  bool? breastfed;
  bool? gettingRegularCheckups; // Track regular checkups
  DateTime? lastMammographyDate; // Track last mammography date

  final List<String> breastChanges = [
    "Lump",
    "Discharge",
    "Change in size",
    "Change in shape",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20), // Space

          // Are you getting regular checkups?
          Text(
            'Are you getting regular checkups?',
            style: TextStyle(fontSize: 14, color: Color(0xFFFB6F92)),
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
              Text('Yes', style: TextStyle(fontSize: 14, color: Colors.grey)),
              Radio<bool>(
                value: false,
                groupValue: gettingRegularCheckups,
                onChanged: (value) {
                  setState(() {
                    gettingRegularCheckups = value;
                  });
                },
              ),
              Text('No', style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          SizedBox(height: 20), // Space between sections

          // Last Mammography Date
          Text(
            'Last mammography date:',
            style: TextStyle(fontSize: 14, color: Color(0xFFFB6F92)),
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
                initialDate: lastMammographyDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  lastMammographyDate = pickedDate;
                });
              }
            },
            controller: TextEditingController(
              text: lastMammographyDate != null
                  ? lastMammographyDate!.toLocal().toString().split(' ')[0]
                  : '',
            ),
          ),
          SizedBox(height: 40), // Space

          // Did you notice a change in your breasts?
          Text(
            'Did you notice any changes in your breasts?',
            style: TextStyle(color: Color(0xFFFB6F92)),
          ),
          Row(
            children: [
              Radio<bool>(
                value: true,
                groupValue: hasBreastChange,
                onChanged: (value) {
                  setState(() {
                    hasBreastChange = value;
                  });
                },
              ),
              Text('Yes', style: TextStyle(color: Colors.grey)),
              Radio<bool>(
                value: false,
                groupValue: hasBreastChange,
                onChanged: (value) {
                  setState(() {
                    hasBreastChange = value;
                    breastChangeDetail = null; // Reset detail if "No" is selected
                  });
                },
              ),
              Text('No', style: TextStyle(color: Colors.grey)),
            ],
          ),
          if (hasBreastChange == true) ...[
            // If "Yes", show the list of changes
            Column(
              children: breastChanges.map((change) {
                return CheckboxListTile(
                  title: Text(
                    change,
                    style: TextStyle(color: Colors.grey),
                  ),
                  value: breastChangeDetail == change,
                  onChanged: (value) {
                    setState(() {
                      breastChangeDetail = value == true ? change : null;
                    });
                  },
                );
              }).toList(),
            ),
            // Other change text field
            if (breastChangeDetail == 'Other') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Please specify the change:',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                onChanged: (value) {
                  breastChangeDetail = value; // Store the specified change
                },
              ),
            ],
          ],
          SizedBox(height: 40), // Space

          // Are you a mother?
          Text(
            'Are you a mother?',
            style: TextStyle(color: Color(0xFFFB6F92)),
          ),
          Row(
            children: [
              Radio<bool>(
                value: true,
                groupValue: isMother,
                onChanged: (value) {
                  setState(() {
                    isMother = value;
                    breastfed = null; // Reset breastfeeding question if selected
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
            // If "Yes", ask if they breastfed
            Text(
              'Did you breastfeed during your pregnancies?',
              style: TextStyle(color: Color(0xFFFB6F92)),
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
          SizedBox(height: 40), // Space

          // Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              SizedBox(
                width: 140,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onBack(); // Go back to Step 2
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(color: Color(0xFFFB6F92)), // Pink font color
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // White background
                  ),
                ),
              ),
              // Sign Up Button
              SizedBox(
                width: 140,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the Get Started Screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => GetStartedScreen()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white), // White font color
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFB6F92), // Pink background
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
