import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final iconImage;
  final String Categoryname;
  const Category({required this.iconImage, required this.Categoryname});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue[200],
        ),
        child: Row(

          children: [
            Image.asset(iconImage, height: 30),
            SizedBox(width: 10),
            Text(Categoryname),
          ],
        ),
      ),
    );
  }
}


