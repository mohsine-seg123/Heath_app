import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
      isDark ? Theme.of(context).scaffoldBackgroundColor : Colors.blue[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 HEADER
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.medical_services,
                    size: 70,
                    color: isDark ? Colors.tealAccent : Colors.teal,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Medica+ App",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.tealAccent : Colors.teal,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 WHO WE ARE
            Text(
              "Who We Are",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Medica+ is a modern medical assistant app designed to help "
                  "users access reliable medical advice, explore doctors from "
                  "different specialties, and book appointments easily.",
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 FEATURES
            Text(
              "What Our App Offers",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 15),

            _featureItem(
              isDark,
              icon: Icons.health_and_safety,
              title: "Medical Advice",
              subtitle:
              "Get verified health tips and guidance for common medical questions.",
            ),
            _featureItem(
              isDark,
              icon: Icons.people,
              title: "Doctors by Specialty",
              subtitle:
              "Explore professionals in Dentistry, Surgery, Pharmacy, "
                  "Cardiology, Neurology, and more.",
            ),
            _featureItem(
              isDark,
              icon: Icons.calendar_month,
              title: "Online Appointment Booking",
              subtitle:
              "Schedule appointments with doctors directly through the app.",
            ),
            _featureItem(
              isDark,
              icon: Icons.assignment_ind,
              title: "Mini Medical Profile",
              subtitle:
              "Fill a simple form with your name, age, allergies, and symptoms "
                  "to get adapted suggestions.",
            ),

            const SizedBox(height: 15),

            // 🔹 MISSION
            Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "We believe that medical knowledge should be accessible to everyone. "
                  "Our goal is to make healthcare easier, faster, and more connected "
                  "by bringing doctors and patients together through one platform.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 🔹 FEATURE ITEM
  Widget _featureItem(
      bool isDark, {
        required IconData icon,
        required String title,
        required String subtitle,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32,
            color: isDark ? Colors.tealAccent : Colors.teal,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.4,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
