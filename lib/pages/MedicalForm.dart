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

                    // Show the entered data
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Medical Record Saved"),
                        content: Text(
                            "Name: $name\nAge: $age\nAllergies: $allergies\nMedications: $medications\nSymptoms: $symptoms"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_)=>HomePage())),
                              child: Text("OK"))
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
}


