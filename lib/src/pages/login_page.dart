import 'package:flutter/material.dart';
import 'package:patientapp/src/pages/user_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(

                      "assets/login.jpg"
                  )
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Container(

                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'UserName Required';
                            }
                            return null;
                          },
                          controller: _userNameController,
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 0, bottom: 0, right: 20, left: 20),
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            // labelText: "Email...",
                            hintText: "User Name...",

                            labelStyle: TextStyle(color: Colors.black),
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                            focusedBorder: borderStyle(),
                            focusedErrorBorder: borderStyle(),
                            errorBorder: borderStyle(),
                            enabledBorder: borderStyle(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          validator: (value) {
                            RegExp regexUpper = RegExp(r'^(?=.*?[A-Z])');
                            RegExp regexDigit = RegExp(r'^(?=.*?[0-9])');

                            if (value == null || value.isEmpty) {
                              return 'Password Required';
                            }
                            if (value.length < 7) {
                              return 'Password Must 7 Characters Required';
                            }

                            if (!regexUpper.hasMatch(value)) {
                              return 'Password should contain a upper Case character ';
                            }

                            if (!regexDigit.hasMatch(value)) {
                              return 'Password should contain a Digit ';
                            }
                            if (!value.contains(
                                new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return 'Password should contain a Special character ';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 0, bottom: 10, right: 20, left: 20),
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: "Password...",
                            labelStyle: TextStyle(color: Colors.black),
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                            focusedBorder: borderStyle(),
                            focusedErrorBorder: borderStyle(),
                            errorBorder: borderStyle(),
                            enabledBorder: borderStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_userNameController.text != "Fininfocom" ||
                          _passwordController.text != "Fin@123") {
                        const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Invalid Credential"));
                        _scaffoldKey.currentState!.showSnackBar(snackBar);
                      } else {
                        const snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Login Success"));
                        SharedPreferences? prefs;
                        prefs = await SharedPreferences.getInstance();
                      await
                      prefs.setString("username", _userNameController.text);
                        _scaffoldKey.currentState!.showSnackBar(snackBar);
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>
                        UsersViewPage()));
                      }
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.black, width: 1));
  }
}
