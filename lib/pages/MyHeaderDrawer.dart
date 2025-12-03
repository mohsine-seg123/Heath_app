import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String? email;
  String ? username;
  Future <String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }
  Future <String?> getemail()async{
    final prefs= await SharedPreferences.getInstance();
    return prefs.getString("email");
  }
  void initState() {
    super.initState();
    loadEmail();
  }
  void loadEmail() async {
    String? Email=await getemail();
    String? name=await getUsername();
    setState(() {
      email=Email;
      username=name;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/drawerBack.jpg"),
          fit: BoxFit.cover,
        ),

      ),
      width: double.infinity,
      height: 400,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/black.png'),
              ),
            ),
          ),
          Text(
            "${username ?? "User"}",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "${email ?? "user@gmail.com"}",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
