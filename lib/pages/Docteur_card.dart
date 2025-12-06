import 'package:flutter/material.dart';

class DocteurCard extends StatelessWidget {
  final String DocImgPath;
  final String rating;
  final String Docname;
  final String specialite;
  final String ville;
  final VoidCallback? onTap; // ✅ IMPORTANT

  const DocteurCard({
    super.key,
    required this.DocImgPath,
    required this.rating,
    required this.Docname,
    required this.specialite,
    required this.ville,
    this.onTap, // ✅ IMPORTANT
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(  // ✅ ✅ ✅ ÉCOUTEUR DE CLIC ICI
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                DocImgPath,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 80);
                },
              ),
            ),

            const SizedBox(height: 8),

            // ✅ RATING
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  rating,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // ✅ NOM
            Text(
              Docname,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 4),

            // ✅ SPECIALITÉ
            Text(
              specialite,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 4),

            // ✅ VILLE
            Text(
              ville,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



