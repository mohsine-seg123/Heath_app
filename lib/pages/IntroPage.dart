import 'package:flutter/material.dart';
import 'package:untitled1/pages/LoginPage.dart';
import 'package:untitled1/pages/SignUp.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Text(
                   "Find doctors, book appointments, and get health advice easily.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700], fontSize: 15),
                  ),
                ],
              ),

              // Image en bas
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Health.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Column(
                children: <Widget>[
                     MaterialButton(
                       minWidth: double.infinity,
                       height: 60,
                       onPressed: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginPage()));
                       },
                       shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color:Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(50),
                       ),
                       child: Text("Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                        ),),

                     ),
                     SizedBox(height: 20),
                     MaterialButton(
                           minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                   color: Color(0xFF0095FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),

                    child: Text(
                      "sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
