import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String iconImage;
  final String Categoryname;
  final VoidCallback? onTap;   // <-- callback

  const Category({
    required this.iconImage,
    required this.Categoryname,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: InkWell(
        onTap: onTap,   // <-- rend cliquable
        borderRadius: BorderRadius.circular(12),
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
      ),
    );
  }
}



