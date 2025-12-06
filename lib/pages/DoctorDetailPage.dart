import 'package:flutter/material.dart';

class DoctorProfilePage extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String city;
  final String rating;
  final String imagePath;

  // Infos supplémentaires pour parcours
  final List<String> education;
  final List<String> experience;
  final String bio;

  const DoctorProfilePage({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.city,
    required this.rating,
    required this.imagePath,
    required this.education,
    required this.experience,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(doctorName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                doctorName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                "$specialty | $city",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(rating),
                ],
              ),
            ),
            const Divider(height: 30, thickness: 1),
            const Text(
              "Biography",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              bio,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Education",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...education.map((e) => ListTile(
              leading: const Icon(Icons.school),
              title: Text(e),
            )),
            const SizedBox(height: 16),
            const Text(
              "Experience",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...experience.map((e) => ListTile(
              leading: const Icon(Icons.work),
              title: Text(e),
            )),
          ],
        ),
      ),
    );
  }
}

