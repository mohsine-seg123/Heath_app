import 'package:flutter/material.dart';
import 'package:untitled1/pages/Category.dart';
import 'package:untitled1/pages/Docteur_card.dart';
import 'package:lottie/lottie.dart';

import 'MedicalForm.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            // app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Mohssine", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  // partie de profil
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            // card how do you feel?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(12),
                ),

                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    // animation or cute picture
                    Container(
                      height: 170,
                      width: 170,
                      child: Lottie.asset('assets/lottie/Doctor.json'),
                    ),
                    SizedBox(width: 20),

                    // how do you feel+get started button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How do you feel",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Fill out your medical card right now",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => MedicalForm()),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(child: Text("Get Started")),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18),
            // search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "How we can help you?",
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            // horizontal listview -> categories dentist, surgeon...
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Category(
                    iconImage: 'assets/images/tooth1.png',
                    Categoryname: "Dentist",
                  ),
                  Category(
                    iconImage: 'assets/images/surgeon.png',
                    Categoryname: "Surgeon",
                  ),
                  Category(
                    iconImage: 'assets/images/capsule.png',
                    Categoryname: "Pharmacist",
                  ),
                  Category(
                    iconImage: 'assets/images/cardiology.png',
                    Categoryname: "Cardiology",
                  ),
                  Category(
                    iconImage: 'assets/images/brain.png',
                    Categoryname: "Neurologie",
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            //doctor list
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor list",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 16, color: Colors.grey[500],fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18,),
            Container(
              height: 220,
              child: ListView(
              scrollDirection: Axis.horizontal,
                      children: [
                        DocteurCard(
                          DocImgPath: "assets/images/DOCRE1.png",
                          rating: "4.5",
                          Docname: "Dr.Amal Bourquia",
                          specialite: "Nephrology & Pediatric Nephrology",
                        ),
                        DocteurCard(
                          DocImgPath: "assets/images/DOCRE2.png",
                          rating: "4.8",
                          Docname: "Abdellatif Berbich",
                          specialite: "Internal Medicine & Nephrology",
                        ),

                        DocteurCard(
                          DocImgPath: "assets/images/DOCRE3.png",
                          rating: "4.8",
                          Docname: "Rochdi Talib",
                          specialite: "Anesthesia & Intensive Care ",
                        ),

                      ],
            ),),



          ],
        ),
      ),
    ),
    );
  }
}
