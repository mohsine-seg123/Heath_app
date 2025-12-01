import 'package:flutter/material.dart';

class DocteurCard extends StatelessWidget {
  final DocImgPath;
  final String rating;
  final String Docname;
  final String specialite;

  const DocteurCard({
    required this.DocImgPath,
    required this.rating,
    required this.Docname,
    required this.specialite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(12.0),
        ),

        child: Column(
          children: [
            // picture of doctor
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(this.DocImgPath, height: 100),
            ),

            // rating out of 5
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[700]),
                Text(this.rating, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 5),
            // doctor name
            Text(
              this.Docname,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(height: 5),
            Text(this.specialite),
          ],
        ),
      ),
    );
  }
}
