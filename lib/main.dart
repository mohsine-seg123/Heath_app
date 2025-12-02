import 'package:flutter/material.dart';
import 'package:untitled1/pages/About.dart';
import 'package:untitled1/pages/Doctors.dart';
import 'package:untitled1/pages/MyHeaderDrawer.dart';
import 'package:untitled1/pages/Settings.dart';
import 'package:untitled1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.Home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.Home) {
      container = Home_Page();
    } else if (currentPage == DrawerSections.settings) {
      container = MedicalSettingsPage();
    } else if (currentPage == DrawerSections.Doctors) {
      container = Doctors();
    } else if (currentPage == DrawerSections.Logout){
      //container=Login();
    }
    else if (currentPage == DrawerSections.About){
      container=AboutPage();
    }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
          title: Text("welcome to medecine  app"),
        ),
        body: container,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(children: [MyHeaderDrawer(), MyDrawerList()]),
            ),
          ),
        ),
      );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        // shows the list of menu drawer
        children: [
          MenuItem(1, "Home", Icons.home, currentPage == DrawerSections.Home),
          Divider(),
          MenuItem(
            2,
            "Doctors",
            Icons.dark_mode_rounded,
            currentPage == DrawerSections.Doctors,
          ),
          Divider(),
          MenuItem(
            3,
            "Settings",
            Icons.settings_outlined,
            currentPage == DrawerSections.settings,
          ),
          Divider(),
          MenuItem(
            4,
            "About Us",
            Icons.info,
            currentPage == DrawerSections.About,
          ),
          Divider(),
          MenuItem(
            5,
            "Logout",
            Icons.logout,
            currentPage == DrawerSections.Logout,
          ),
        ],
      ),
    );
  }

  Widget MenuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            // les conditions pour donner currentPage une valeur selon enum
            if (id == 1) {
              currentPage = DrawerSections.Home;
            } else if (id == 2) {
              currentPage = DrawerSections.Doctors;
            } else if (id == 3) {
              currentPage = DrawerSections.settings;
            }else if (id == 4) {
              currentPage = DrawerSections.About;
            }
            else if (id == 5) {
              currentPage = DrawerSections.Logout;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(child: Icon(icon, size: 20, color: Colors.black)),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections { Home, listmedecine, settings, Doctors,About,Logout}
