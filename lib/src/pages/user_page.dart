import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_details_model.dart';
import 'login_page.dart';

class UsersViewPage extends StatefulWidget {
  const UsersViewPage({Key? key}) : super(key: key);

  @override
  _UsersViewPageState createState() => _UsersViewPageState();
}

class _UsersViewPageState extends State<UsersViewPage> {
  SharedPreferences? pref;
  bool loadPage = false;
  final fireStore = FirebaseFirestore.instance;
  Map userProfileData = {'name': '', 'age': 0, 'city': ''};
  List<UsersDetailsModel> users = [];

  @override
  void initState() {
    getUsersDetails();
    super.initState();
  }

  //get users details
  getUsersDetails() async {
    loadPage = true;
    var response =
        await FirebaseFirestore.instance.collection("users_detail").get();

    setState(() {
      users = List.from(
          response.docs.map((doc) => UsersDetailsModel.fromSnapshot(doc)));
    });

    setState(() {
      loadPage = false;
    });
  }

  //get sorted  By Age
  getOrderByAge(bool ascending) async {
    var response = await FirebaseFirestore.instance
        .collection("users_detail")
        .orderBy('age', descending: ascending ? false : true)
        .get();

    setState(() {
      users = List.from(
          response.docs.map((doc) => UsersDetailsModel.fromSnapshot(doc)));
    });
  }

  //get sorted  By Name
  getOrderByName(bool ascending) async {
    var response = await FirebaseFirestore.instance
        .collection("users_detail")
        .orderBy('name', descending: ascending ? false : true)
        .get();

    setState(() {
      users = List.from(
          response.docs.map((doc) => UsersDetailsModel.fromSnapshot(doc)));
    });
  }

  //get sorted  By City
  getOrderByCity(bool ascending) async {
    var response = await FirebaseFirestore.instance
        .collection("users_detail")
        .orderBy('city', descending: ascending ? false : true)
        .get();

    setState(() {
      users = List.from(
          response.docs.map((doc) => UsersDetailsModel.fromSnapshot(doc)));
    });
  }

  // exit window
  exitWindow() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm Exit"),
            content: Text("Are you sure you want to exit?"),
            actions: <Widget>[
              FlatButton(
                child: Text("YES"),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
              FlatButton(
                child: Text("NO"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitWindow(),
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            elevation: 16.0,
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(""),
                  accountEmail: Text(""),
                ),
                Divider(
                  height: 0.1,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text("Sorting Name")),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        setState(() {
                          users = [];
                        });
                        getOrderByName(true);

                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          "Ascending",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            users = [];
                          });
                          getOrderByName(false);

                          Navigator.pop(context);
                        },
                        child: const Center(
                          child: Text(
                            "Descending",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text("Sorting Age")),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        setState(() {
                          users = [];
                        });
                        getOrderByAge(true);

                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          "Ascending",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            users = [];
                          });
                          getOrderByAge(false);

                          Navigator.pop(context);
                        },
                        child: const Center(
                          child: Text(
                            "Descending",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text("Sorting City")),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        setState(() {
                          users = [];
                        });
                        getOrderByCity(true);

                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          "Ascending",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            users = [];
                          });
                          getOrderByCity(false);

                          Navigator.pop(context);
                        },
                        child: const Center(
                          child: Text(
                            "Descending",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 380,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 170,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            users = [];
                          });
                          getUsersDetails();

                          Navigator.pop(context);
                        },
                        child: const Center(
                          child: Text(
                            "Reset All",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: Colors.indigo[50],
          appBar: AppBar(
            title: const Text("Users Summary "),
            centerTitle: true,
            actions: [
              InkWell(
                  onTap: () {
                    logout();
                  },
                  child: const Icon(Icons.logout))
            ],
          ),
          body: loadPage
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            "assets/users.jpg",
                          ))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const ClampingScrollPhysics(),
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                // height: 100,
                                child: Card(
                                  shadowColor: Colors.blueAccent,
                                  elevation: 5,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                30,
                                      ),

                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                30,
                                      ),

                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${users[index].name.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.blueAccent),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      "Age : ${users[index].age.toString()}\n"
                                                      "City : ${users[index].city.toString()}\n"),
                                                ],
                                              )
                                            ],
                                          )),
                                      // Expanded(child: Container()),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  //logout
  logout() {
    showDialog(
        builder: (ctxt) {
          return AlertDialog(
              title: Text("Logout"),
              content: Container(
                height: 80,
                child: Column(
                  children: [
                    Text("Do you Really want to logout?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        RaisedButton(
                          child: Text("Logout"),
                          onPressed: () async {
                            pref = await SharedPreferences.getInstance();
                            await pref!.remove("userToken");
                            await pref!.remove("username");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ));
        },
        context: context);
  }
}
