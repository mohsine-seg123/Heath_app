import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lottie/lottie.dart';

class MedicalSettingsPage extends StatefulWidget {
  const MedicalSettingsPage({Key? key}) : super(key: key);

  @override
  State<MedicalSettingsPage> createState() => _MedicalSettingsPageState();
}

class _MedicalSettingsPageState extends State<MedicalSettingsPage> {
  bool darkMode = false;
  bool notifications = true;
  bool proximityDoctors = true;
  double medicineReminder = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_touohxv0.json',
                height: 120,
              ),
              Text(
                "🩺 Medical Settings",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.teal.shade900,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    // Dark Mode
                    settingTile(
                      icon: Icons.nightlight_round,
                      title: "Dark Mode",
                      child: FlutterSwitch(
                        value: darkMode,
                        onToggle: (val) {
                          setState(() {
                            darkMode = val;
                          });
                        },
                        activeColor: Colors.deepPurpleAccent,
                        inactiveColor: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Notifications
                    settingTile(
                      icon: Icons.notifications_active,
                      title: "Notifications",
                      child: FlutterSwitch(
                        value: notifications,
                        onToggle: (val) {
                          setState(() {
                            notifications = val;
                          });
                        },
                        activeColor: Colors.orangeAccent,
                        inactiveColor: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Doctors by proximity
                    settingTile(
                      icon: Icons.location_on,
                      title: "Nearby Doctors",
                      child: FlutterSwitch(
                        value: proximityDoctors,
                        onToggle: (val) {
                          setState(() {
                            proximityDoctors = val;
                          });
                        },
                        activeColor: Colors.greenAccent,
                        inactiveColor: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Medicine reminder level
                    settingTile(
                      icon: Icons.medical_services,
                      title: "Reminder Intensity",
                      child: Expanded(
                        child: Slider(
                          value: medicineReminder,
                          min: 0,
                          max: 1,
                          divisions: 10,
                          activeColor: Colors.pinkAccent,
                          inactiveColor: Colors.pink.shade100,
                          onChanged: (value) {
                            setState(() {
                              medicineReminder = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingTile({required IconData icon, required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black),
              SizedBox(width: 15),
              Text(title, style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ),
          child,
        ],
      ),
    );
  }
}

