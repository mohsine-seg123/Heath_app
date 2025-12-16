import 'package:flutter/material.dart';
import 'package:HealthConnect/pages/Category.dart';
import 'package:HealthConnect/pages/Docteur_card.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:HealthConnect/pages/Doctors.dart';

import 'Data_doctors.dart';
import 'DoctorDetailPage.dart';
import 'DoctorsBycategory.dart';
import 'MedicalForm.dart';
import 'SearchDoctorsPage.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {
  String? username;

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }

  Future<String?> getemail() async {
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
        child: SingleChildScrollView(
          // ✅ SCROLL UNIQUE POUR TOUT
          child: Column(
            children: [
              // ✅ HEADER CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor, // ✅ dynamique
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
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
                        Text(
                          "Welcome back",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          username ?? "User",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
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
                decoration: BoxDecoration(color: Colors.blue[400]),
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
                              fontSize: 18,
                            ),
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ SEARCH
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SearchDoctorsPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const TextField(
                    enabled: false, // 👈 empêche l’édition ici
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search doctor...",
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 20),

              // ✅ CATEGORIES
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Category(
                      iconImage: 'assets/images/tooth1.png',
                      Categoryname: "Dentist",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsByCategory(
                              category: "Dentist",
                              doctors: doctorsData,
                            ),
                          ),
                        );
                      },
                    ),
                    Category(
                      iconImage: 'assets/images/surgeon.png',
                      Categoryname: "Surgeon",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsByCategory(
                              category: "Surgeon",
                              doctors: doctorsData,
                            ),
                          ),
                        );
                      },
                    ),
                    Category(
                      iconImage: 'assets/images/capsule.png',
                      Categoryname: "Pharmacist",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsByCategory(
                              category: "Pharmacist",
                              doctors: doctorsData,
                            ),
                          ),
                        );
                      },
                    ),
                    Category(
                      iconImage: 'assets/images/cardiology.png',
                      Categoryname: "Cardiology",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsByCategory(
                              category: "Cardiology",
                              doctors: doctorsData,
                            ),
                          ),
                        );
                      },
                    ),
                    Category(
                      iconImage: 'assets/images/brain.png',
                      Categoryname: "Neurologie",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsByCategory(
                              category: "Neurologie",
                              doctors: doctorsData,
                            ),
                          ),
                        );
                      },
                    ),
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
                      "Pioneers of medecine",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Color(0xFF1976D2),
                        fontWeight: FontWeight.bold,
                      ),
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
                  children: [

                    // ===================== DOCTEUR 1 =====================
                    DocteurCard(
                      DocImgPath: "assets/images/DOCRE1.png",
                      rating: "5",
                      Docname: "Dr.Amal Bourquia",
                      specialite: "Nephrology",
                      ville: "Fés",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorProfilePage(
                              doctorName: "Dr.Amal Bourquia",
                              specialty: "Nephrology",
                              city: "Fés",
                              rating: "5",
                              imagePath: "assets/images/DOCRE1.png",
                              bio:
                              "Dr. Amal Bourquia is a leading nephrologist in Morocco with a strong passion for kidney health and patient care.",
                              education: [
                                "MD, University of Fés, Morocco",
                                "Residency in Nephrology, Paris, France",
                                "Fellowship in Kidney Transplant, London, UK",
                              ],
                              experience: [
                                "Head of Nephrology Department, Fés Hospital",
                                "10+ years of clinical experience",
                                "Published research in international journals",
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 10),

                    // ===================== DOCTEUR 2 =====================
                    DocteurCard(
                      DocImgPath: "assets/images/DOCRE2.png",
                      rating: "5",
                      Docname: "Abdellatif Berbich",
                      specialite: "Internal Medicine",
                      ville: "Tanger",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorProfilePage(
                              doctorName: "Abdellatif Berbich",
                              specialty: "Internal Medicine",
                              city: "Tanger",
                              rating: "5",
                              imagePath: "assets/images/DOCRE2.png",
                              bio:
                              "Pioneer of internal medicine and nephrology in Morocco.",
                              education: [
                                "MD, University of Montpellier",
                                "Specialization in Nephrology, Paris",
                              ],
                              experience: [
                                "Founder of multiple dialysis centers",
                                "Over 30 years of medical experience",
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 10),

                    // ===================== DOCTEUR 3 =====================
                    DocteurCard(
                      DocImgPath: "assets/images/DOCRE3.png",
                      rating: "5",
                      Docname: "Rochdi Talib",
                      specialite: "Anesthesia",
                      ville: "Rabat",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorProfilePage(
                              doctorName: "Rochdi Talib",
                              specialty: "Anesthesia",
                              city: "Rabat",
                              rating: "5",
                              imagePath: "assets/images/DOCRE3.png",
                              bio:
                              "Specialist in anesthesia and intensive care.",
                              education: [
                                "MD, Faculty of Medicine Rabat",
                              ],
                              experience: [
                                "Head of anesthesia department",
                                "15 years of experience",
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 10),

                    // ===================== DOCTEUR 4 =====================
                    DocteurCard(
                      DocImgPath: "assets/images/imf2.jpg",
                      rating: "5",
                      Docname: "Latifa Gharbaoui",
                      specialite: "Radiology / Medical Imaging",
                      ville: "Houston, USA",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorProfilePage(
                              doctorName: "Latifa Gharbaoui",
                              specialty: "Radiology / Medical Imaging",
                              city: "Houston, USA",
                              rating: "5",
                              imagePath: "assets/images/imf2.jpg",
                              bio:
                              "Expert in medical imaging and radiological diagnosis.",
                              education: [
                                "MD, Casablanca",
                                "Radiology specialization, USA",
                              ],
                              experience: [
                                "Radiologist at major US hospitals",
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 10),

                    // ===================== DOCTEUR 5 =====================
                    DocteurCard(
                      DocImgPath: "assets/images/imf1.jpg",
                      rating: "5",
                      Docname: "Rajae Ghanimi",
                      specialite: "Public Health / Health Insurance",
                      ville: "Casablanca",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorProfilePage(
                              doctorName: "Rajae Ghanimi",
                              specialty: "Public Health / Health Insurance",
                              city: "Casablanca",
                              rating: "5",
                              imagePath: "assets/images/imf1.jpg",
                              bio:
                              "Specialist in public health and medical insurance.",
                              education: [
                                "MD, Rabat",
                              ],
                              experience: [
                                "Health insurance consultant",
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 10),

                    // ===================== DOCTEUR 6 =====================
                    DocteurCard(
                      DocImgPath: "assets/images/imf.jpg",
                      rating: "5",
                      Docname: "Abderrahim Harouchi",
                      specialite: "Pediatric Surgery / Public Health",
                      ville: "Casablanca",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorProfilePage(
                              doctorName: "Abderrahim Harouchi",
                              specialty: "Pediatric Surgery / Public Health",
                              city: "Casablanca",
                              rating: "5",
                              imagePath: "assets/images/imf.jpg",
                              bio:
                              "Former Minister of Health and pediatric surgery expert.",
                              education: [
                                "MD, Paris",
                              ],
                              experience: [
                                "Former Minister of Health",
                                "Professor of Pediatric Surgery",
                              ],
                            ),
                          ),
                        );
                      },
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
