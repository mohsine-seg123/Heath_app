import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart'; // ⚠️ IMPORTANT pour MyApp.setDarkMode

class MedicalSettingsPage extends StatefulWidget {
  const MedicalSettingsPage({Key? key}) : super(key: key);

  @override
  State<MedicalSettingsPage> createState() => _MedicalSettingsPageState();
}

class _MedicalSettingsPageState extends State<MedicalSettingsPage> {
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    loadDarkMode();
  }

  // 🔹 Charger l’état du Dark Mode
  Future<void> loadDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      darkMode = prefs.getBool("darkMode") ?? false;
    });
  }

  // 🔹 Message pour options non encore disponibles
  void showFutureMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "This option will be available in a future update.",
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
              const SizedBox(height: 20),

              // 🎬 Animation
              Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_touohxv0.json',
                height: 120,
              ),

              const SizedBox(height: 10),

              const Text(
                "🩺 Medical Settings",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    //  DARK MODE (RÉEL)
                    settingTile(
                      icon: Icons.nightlight_round,
                      title: "Dark Mode",
                      child: FlutterSwitch(
                        value: darkMode,
                        activeColor: Colors.deepPurple,
                        onToggle: (val) {
                          setState(() {
                            darkMode = val;
                          });
                          //  Change le thème de toute l’app
                          MyApp.setDarkMode(context, val);
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    //  FUTURE OPTION
                    settingTile(
                      icon: Icons.notifications_active,
                      title: "Notifications",
                      child: IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: showFutureMessage,
                      ),
                    ),

                    const SizedBox(height: 20),

                    //  FUTURE OPTION
                    settingTile(
                      icon: Icons.location_on,
                      title: "Nearby Doctors",
                      child: IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: showFutureMessage,
                      ),
                    ),

                    const SizedBox(height: 20),

                    settingTile(
                      icon: Icons.medical_services,
                      title: "Reminder Intensity",
                      child: IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: showFutureMessage,
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

  // 🔹 Widget réutilisable
  Widget settingTile({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}


