import 'package:flutter/material.dart';
import 'package:untitled1/pages/Category.dart';
import 'package:untitled1/pages/Docteur_card.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MedicalForm.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({super.key});



  @override
  State<Home_Page> createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {
  String? username;

  Future <String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }

  Future <String?> getemail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  void initState() {
    super.initState();
    loadUsername();
  }

  void loadUsername() async {
    String? name = await getUsername();
    setState(() {
      username = name;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // ✅ SCROLL UNIQUE POUR TOUT
          child: Column(
            children: [

              // ✅ HEADER CARD
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color(0xFF1976D2),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Welcome back",
                            style: TextStyle(color: Colors.grey)),
                        Text(
                          username ?? "User",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ✅ MEDICAL CARD
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Lottie.asset('assets/lottie/Doctor.json'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Medical Card",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Fill out your medical card",
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MedicalForm(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Color(0xFF1976D2),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // ✅ SEARCH
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search doctor...",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ✅ CATEGORIES
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Category(iconImage: 'assets/images/tooth1.png',
                        Categoryname: "Dentist"),
                    Category(iconImage: 'assets/images/surgeon.png',
                        Categoryname: "Surgeon"),
                    Category(iconImage: 'assets/images/capsule.png',
                        Categoryname: "Pharmacist"),
                    Category(iconImage: 'assets/images/cardiology.png',
                        Categoryname: "Cardiology"),
                    Category(iconImage: 'assets/images/brain.png',
                        Categoryname: "Neurologie"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ✅ TITRE DOCTORS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Doctor List",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: Color(0xFF1976D2),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // ✅ DOCTORS
              SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DocteurCard(
                      DocImgPath: "assets/images/DOCRE1.png",
                      rating: "4.5",
                      Docname: "Dr.Amal Bourquia",
                      specialite: "Nephrology",
                    ),
                    DocteurCard(
                      DocImgPath: "assets/images/DOCRE2.png",
                      rating: "4.8",
                      Docname: "Abdellatif Berbich",
                      specialite: "Internal Medicine",
                    ),
                    DocteurCard(
                      DocImgPath: "assets/images/DOCRE3.png",
                      rating: "4.8",
                      Docname: "Rochdi Talib",
                      specialite: "Anesthesia",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
