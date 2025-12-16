import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:HealthConnect/pages/About.dart';
import 'package:HealthConnect/pages/Doctors.dart';
import 'package:HealthConnect/pages/IntroPage.dart';
import 'package:HealthConnect/pages/LoginPage.dart';
import 'package:HealthConnect/pages/MyHeaderDrawer.dart';
import 'package:HealthConnect/pages/Settings.dart';
import 'package:HealthConnect/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  bool isDarkMode = prefs.getBool("darkMode") ?? false;

  runApp(
    MyApp(
      isLoggedIn: isLoggedIn,
      isDarkMode: isDarkMode,
    ),
  );
}


class MyApp extends StatefulWidget {
  final bool isLoggedIn;
  final bool isDarkMode;

  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.isDarkMode,
  });

  @override
  State<MyApp> createState() => _MyAppState();

  // 👉 permet de changer le thème depuis n’importe quelle page
  static void setDarkMode(BuildContext context, bool value) {
    final _MyAppState? state =
    context.findAncestorStateOfType<_MyAppState>();
    state?.updateTheme(value);
  }
}

class _MyAppState extends State<MyApp> {
  late bool darkMode;

  @override
  void initState() {
    super.initState();
    darkMode = widget.isDarkMode;
  }

  Future<void> updateTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkMode", value);

    setState(() {
      darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🌙 THÈME GLOBAL
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),

      // ROUTES
      initialRoute: widget.isLoggedIn ? "/home" : "/intro",
      routes: {
        "/intro": (context) => const IntroPage(),
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
      },
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
      container = DoctorsPage();
    }
    else if (currentPage == DrawerSections.About){
      container=AboutPage();
    }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
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
          onTap: () async {
            Navigator.pop(context);
            if (id == 5) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("isLoggedIn", false);
              Navigator.pushNamedAndRemoveUntil(context, "/intro", (route) => false);
            } else {
              setState(() {
                if (id == 1) {
                  currentPage = DrawerSections.Home;
                } else if (id == 2) {
                  currentPage = DrawerSections.Doctors;
                } else if (id == 3) {
                  currentPage = DrawerSections.settings;
                } else if (id == 4) {
                  currentPage = DrawerSections.About;
                }
              });
            }
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
