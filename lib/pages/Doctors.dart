import 'package:flutter/material.dart';
import 'Docteur_card.dart';
import 'Data_doctors.dart';
import 'AppointmentPage.dart'; // <-- ta page de réservation à créer

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: GridView.builder(
          itemCount: doctorsData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final doc = doctorsData[index];

            return DocteurCard(
              DocImgPath: doc['img']!,
              rating: doc['rating']!,
              Docname: doc['name']!,
              specialite: doc['specialite']!,
              ville: doc['ville']!,
              onTap: () {
                // Navigation vers la page de réservation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AppointmentPage(
                      doctorName: doc['name']!,
                      doctorImg: doc['img']!,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


