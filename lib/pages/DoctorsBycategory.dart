import 'package:flutter/material.dart';
import 'AppointmentPage.dart';
import 'docteur_card.dart';

class DoctorsByCategory extends StatelessWidget {
  final String category;
  final List<Map<String, String>> doctors;

  const DoctorsByCategory({
    super.key,
    required this.category,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    // Filtrer les docteurs selon la spécialité cliquée
    final filteredDoctors = doctors
        .where((doc) => doc["specialite"]!.toLowerCase() == category.toLowerCase())
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors in $category"),
        backgroundColor: Colors.blueAccent,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,     // disposition en 2 colonnes
          crossAxisSpacing: 12, // espace horizental
          mainAxisSpacing: 12,// espace vertical
          childAspectRatio: 0.75, // taille de card
        ),
        itemCount: filteredDoctors.length,
        itemBuilder: (context, index) {
          final doctor = filteredDoctors[index];

          return DocteurCard(
            DocImgPath: doctor["img"]!,
            rating: doctor["rating"]!,
            Docname: doctor["name"]!,
            specialite: doctor["specialite"]!,
            ville: doctor["ville"]!,
            onTap: () {
             Navigator.push(context,
               MaterialPageRoute(
                 builder: (_) => AppointmentPage(
                   doctorName: doctor['name']!,
                   doctorImg: doctor['img']!,
                 ),
               ),
             );
            },
          );
        },
      ),
    );
  }
}
