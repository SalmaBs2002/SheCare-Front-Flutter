import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'custom_navigation_bar.dart'; // Import your custom navigation bar

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Map<String, String>>> appointmentsByDate = {};

  void _addAppointmentDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController doctorController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Appointment"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: doctorController,
                decoration: InputDecoration(labelText: "Doctor"),
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: "Location"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_selectedDay != null &&
                    titleController.text.isNotEmpty &&
                    doctorController.text.isNotEmpty &&
                    locationController.text.isNotEmpty) {
                  setState(() {
                    if (appointmentsByDate[_selectedDay!] == null) {
                      appointmentsByDate[_selectedDay!] = [];
                    }
                    appointmentsByDate[_selectedDay!]!.add({
                      "title": titleController.text,
                      "doctor": doctorController.text,
                      "location": locationController.text,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _modifyAppointmentDialog(BuildContext context) {
    if (_selectedDay == null ||
        appointmentsByDate[_selectedDay!] == null ||
        appointmentsByDate[_selectedDay!]!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No appointments to modify for the selected day.")),
      );
      return;
    }

    var appointment = appointmentsByDate[_selectedDay!]!.first;

    TextEditingController titleController =
        TextEditingController(text: appointment['title']);
    TextEditingController doctorController =
        TextEditingController(text: appointment['doctor']);
    TextEditingController locationController =
        TextEditingController(text: appointment['location']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Modify Appointment"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: doctorController,
                decoration: InputDecoration(labelText: "Doctor"),
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: "Location"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  appointment['title'] = titleController.text;
                  appointment['doctor'] = doctorController.text;
                  appointment['location'] = locationController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text("Modify"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>>? selectedDayAppointments =
        _selectedDay != null ? appointmentsByDate[_selectedDay!] : null;

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarFormat: CalendarFormat.month,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle:
                          TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.pink.shade200,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        if (appointmentsByDate.containsKey(date)) {
                          return Container(
                            margin: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.pink, width: 2.0),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _addAppointmentDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        child: Text(
                          "Add Appointment",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _modifyAppointmentDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.pink),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        child: Text(
                          "Modify Appointment",
                          style: TextStyle(color: Colors.pink),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 7),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Appointments for Selected Day",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade400,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  selectedDayAppointments == null ||
                          selectedDayAppointments.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              "No appointments for this day",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.pink.shade300,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: selectedDayAppointments.length,
                            itemBuilder: (context, index) {
                              final appointment =
                                  selectedDayAppointments[index];
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: Colors.pink, width: 1),
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.event_note,
                                    color: Colors.pink,
                                  ),
                                  title: Text(
                                    appointment['title']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Doctor: ${appointment['doctor']!}"),
                                      Text(
                                          "Location: ${appointment['location']!}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
