import 'package:flutter/material.dart';
import 'Data_doctors.dart';        // doctorsData
import 'AppointmentPage.dart';    // page de réservation

class SearchDoctorsPage extends StatefulWidget {
  const SearchDoctorsPage({super.key});

  @override
  State<SearchDoctorsPage> createState() => _SearchDoctorsPageState();
}

class _SearchDoctorsPageState extends State<SearchDoctorsPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = doctorsData; // afficher tous les docteurs au début
  }

  // 🔍 Fonction de recherche intelligente
  void searchDoctor(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredDoctors = doctorsData;
      });
      return;
    }

    final lowerQuery = query.toLowerCase();

    List<Map<String, String>> exactMatches = [];
    List<Map<String, String>> partialMatches = [];

    for (var doctor in doctorsData) {
      final name = doctor["name"]!.toLowerCase();

      if (name == lowerQuery) {
        exactMatches.add(doctor); // 🔥 match exact
      } else if (name.contains(lowerQuery)) {
        partialMatches.add(doctor); // noms proches
      }
    }

    setState(() {
      filteredDoctors = [...exactMatches, ...partialMatches];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Doctor"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // 🔍 BARRE DE RECHERCHE
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextField(
              controller: searchController,
              onChanged: searchDoctor,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: "Search doctor by name...",
              ),
            ),
          ),

          // 📋 RÉSULTATS
          Expanded(
            child: filteredDoctors.isEmpty
                ? const Center(
              child: Text(
                "No doctor found",
                style: TextStyle(color: Colors.grey),
              ),
            )
                : ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];

                return InkWell(
                  onTap: () {
                    // 👉 OUVRIR PAGE DE RENDEZ-VOUS
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AppointmentPage(
                          doctorName: doctor["name"]!,
                          doctorImg: doctor["img"]!,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(doctor["img"]!),
                    ),
                    title: Text(doctor["name"]!),
                    subtitle: Text(
                      "${doctor["specialite"]} • ${doctor["ville"]}",
                    ),
                    trailing: Text("⭐ ${doctor["rating"]}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


