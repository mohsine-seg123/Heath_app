import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
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
            "Nasr-allah Zouagui",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "nasrzou566@gmail.com",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
