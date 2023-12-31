import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoist/Screens/login.dart';
import 'package:todoist/Screens/register/register2.dart';

import '../register.dart';

class register1 extends StatefulWidget {
  const register1({super.key});

  @override
  State<register1> createState() => _register1State();
}

class _register1State extends State<register1> {
  final _FullNameController = TextEditingController();
  final _UserNameController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void dispose() {
    _FullNameController.dispose();
    _UserNameController.dispose();
    super.dispose();
  }

  Future suivant() async {
    try {
      addUserDetails(
        _FullNameController.text.trim(),
        _UserNameController.text.trim(),
        user.email!,
        // si on utilise un entier on aura
        //int.parse(_FullNameController.text.trim()),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => register2()),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Nous recontrons un probleme de Connection\n"
                  "  - Veillez vous rassurer d'avoir remplit tous les champs\n\n"
                  "                     Merci de coopération "),
            );
          });
    }
  }

  Future addUserDetails(String FullName, String Username, String email) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'Nom et prenom': FullName,
      'Username': Username,
      'email': email,
    });
  }

  void suivant1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => register2()),
    );
  }

  // Crée l'état du widget
  bool obscureText = true; // Définit la valeur de obscureText
  bool checkboxValue = false; // Définit la valeur du checkbox

  void toggleObscureText() {
    // Définit la fonction qui change la valeur de obscureText
    setState(() {
      // Notifie le framework que l'état a changé
      obscureText = !obscureText; // Inverse la valeur de obscureText
      checkboxValue = !checkboxValue; // Inverse la valeur du checkbox
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 10.0,
                  ),
                  child: GestureDetector(
                    //onTap: Foget,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SvgPicture.asset('assets/Ellipse 11.svg'),
                        SvgPicture.asset('assets/Line.svg'),
                        SvgPicture.asset('assets/Ellipse 12.svg'),
                        SvgPicture.asset('assets/Line.svg'),
                        SvgPicture.asset('assets/Ellipse 12.svg'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GradientText(
                        Text("ToDoIst",
                            style: TextStyle(
                                fontSize: 90, fontWeight: FontWeight.bold)),
                        colors: [
                          Color(0xff283576),
                          Color(0xff6D7497),
                          Colors.white
                        ],
                        stops: [0, 0.5, 1],
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 100.0,
                  ),
                  child: GestureDetector(
                    //onTap: Foget,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.black
                                    .withOpacity(0.20000000298023224),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F283576),
                                blurRadius: 10,
                                offset: Offset(10, 14),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: TextField(
                                  controller: _FullNameController,
                                  decoration: InputDecoration(
                                      labelText: 'Nom et prenom',
                                      hintText: "Jason Kitio",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.black
                                    .withOpacity(0.20000000298023224),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F283576),
                                blurRadius: 10,
                                offset: Offset(10, 14),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: TextField(
                                  controller: _UserNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: suivant,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0x3F283576),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return register();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
