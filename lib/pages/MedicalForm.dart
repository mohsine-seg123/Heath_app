import 'package:flutter/material.dart';
import 'package:untitled1/pages/home_page.dart';

import '../main.dart';

class MedicalForm extends StatefulWidget {
  const MedicalForm({super.key});

  @override
  State<MedicalForm> createState() => _MedicalFormState();
}

class _MedicalFormState extends State<MedicalForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String name = '';
  String age = '';
  String allergies = '';
  String medications = '';
  String symptoms = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical Record"),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Full Name"),
                onSaved: (value) => name = value!,
                validator: (value) =>
                value!.isEmpty ? "Please enter your name" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                onSaved: (value) => age = value!,
                validator: (value) =>
                value!.isEmpty ? "Please enter your age" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Allergies"),
                onSaved: (value) => allergies = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Medications"),
                onSaved: (value) => medications = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Current Symptoms"),
                onSaved: (value) => symptoms = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    String result = getMedicalAdvice(symptoms, allergies, medications);

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Medical Recommendation"),
                        content: Text(result),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => HomePage()),
                            ),
                            child: Text("Go to Home"),
                          ),
                        ],
                      ),
                    );
                  }
                },

                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  String getMedicalAdvice(String symptoms, String allergies, String medications) {
    String advice = "";
    String doctor = "";

    // ---- SYMPTÔMES ----
    if (symptoms.toLowerCase().contains("fever") ||
        symptoms.toLowerCase().contains("cough") ||
        symptoms.toLowerCase().contains("flu")) {
      advice =
      "You may have a viral infection. Rest well, drink water, and monitor your temperature.";
      doctor = "General Practitioner (Médecin généraliste)";
    }

    else if (symptoms.toLowerCase().contains("chest pain") ||
        symptoms.toLowerCase().contains("heart")) {
      advice =
      "Chest pain can be serious. Avoid effort and seek medical help immediately.";
      doctor = "Cardiologist (Cardiologue)";
    }

    else if (symptoms.toLowerCase().contains("headache") ||
        symptoms.toLowerCase().contains("dizziness")) {
      advice =
      "This could be caused by stress, dehydration, or migraine. Rest and stay hydrated.";
      doctor = "Neurologist (Neurologue)";
    }

    else if (symptoms.toLowerCase().contains("stomach") ||
        symptoms.toLowerCase().contains("vomiting") ||
        symptoms.toLowerCase().contains("diarrhea")) {
      advice =
      "Avoid spicy food, drink water, and eat light meals.";
      doctor = "Gastroenterologist (Gastro-entérologue)";
    }

    else if (symptoms.toLowerCase().contains("skin") ||
        symptoms.toLowerCase().contains("rash") ||
        symptoms.toLowerCase().contains("acne")) {
      advice =
      "Avoid using new cosmetic products and keep your skin clean.";
      doctor = "Dermatologist (Dermatologue)";
    }

    else {
      advice =
      "Your symptoms require medical evaluation for proper diagnosis.";
      doctor = "General Practitioner (Médecin généraliste)";
    }

    // ---- ALLERGIES ----
    if (allergies.isNotEmpty) {
      advice +=
      "\n\n⚠️ Important: Since you have allergies, always inform your doctor before taking any new medication.";
    }

    // ---- MEDICATIONS ----
    if (medications.isNotEmpty) {
      advice +=
      "\n\n💊 Continue taking your medications only as prescribed by your doctor.";
    }

    return "🩺 Medical Advice:\n$advice\n\n👨‍⚕️ Recommended Doctor:\n$doctor";
  }

}


