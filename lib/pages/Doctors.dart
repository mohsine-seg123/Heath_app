import 'package:flutter/material.dart';
import 'Docteur_card.dart';
import 'Data_doctors.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  Widget build(BuildContext context) {
    // ajuste childAspectRatio si overflow vertical
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: GridView.builder(
          itemCount: doctorsData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72, // <--- augmente si overflow (ex: 0.8) ou diminue si beaucoup d'espace
          ),
          itemBuilder: (context, index) {
            final doc = doctorsData[index];
            return DocteurCard(
              DocImgPath: doc['img']!,
              rating: doc['rating']!,
              Docname: doc['name']!,
              specialite: doc['specialite']!,
              ville: doc['ville']!,
            );
          },
        ),
      ),
    );
  }
}


