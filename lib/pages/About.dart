import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.medical_services,
                      color: Colors.teal, size: 70),
                  const SizedBox(height: 10),
                  const Text(
                    "Medica+ App",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // --- SECTION : Introduction ---
            const Text(
              "Who We Are",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Medica+ is a modern medical assistant app designed to help "
                  "users access reliable medical advice, explore doctors from "
                  "different specialties, and book appointments easily.",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),

            const SizedBox(height: 10),

            // --- SECTION : What the app does ---
            const Text(
              "What Our App Offers",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),

            _featureItem(
              icon: Icons.health_and_safety,
              title: "Medical Advice",
              subtitle:
              "Get verified health tips and guidance for common medical questions.",
            ),

            _featureItem(
              icon: Icons.people,
              title: "Doctors by Specialty",
              subtitle:
              "Explore professionals in Dentistry, Surgery, Pharmacy, "
                  "Cardiology, Neurology, and more.",
            ),

            _featureItem(
              icon: Icons.calendar_month,
              title: "Online Appointment Booking",
              subtitle:
              "Schedule appointments with doctors directly through the app.",
            ),

            _featureItem(
              icon: Icons.assignment_ind,
              title: "Mini Medical Profile",
              subtitle:
              "Fill a simple form with your name, age, allergies, and symptoms "
                  "to get adapted suggestions.",
            ),
            const SizedBox(height: 2),
            const Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "We believe that medical knowledge should be accessible to everyone. "
                  "Our goal is to make healthcare easier, faster, and more connected "
                  "by bringing doctors and patients together through one platform.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 50),


          ],
        ),
      ),
    );
  }

  // --- CUSTOM FEATURE TILE ---
  Widget _featureItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: Colors.teal),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 15, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
