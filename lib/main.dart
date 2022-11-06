import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/src/pages/login_page.dart';
import 'package:patientapp/src/pages/user_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences? prefs;
  prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('userToken');
  var username = prefs.getString('username');

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          token == null && username == null ? LoginScreen() : UsersViewPage()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? pref;
  var val;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: val != null ? const UsersViewPage() : LoginScreen(),
    );
  }
}
