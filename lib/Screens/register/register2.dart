import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoist/Screens/register/register1.dart';
import 'package:todoist/Screens/register/register3.dart';

class register2 extends StatefulWidget {
  const register2({super.key});

  @override
  State<register2> createState() => _register2State();
}

class _register2State extends State<register2> {
  // Crée l'état du widget
  List<String> images = [
    // Définit une liste d'images
    'assets/pp.jpg',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
  ];

  String currentImage = 'assets/pp.jpg'; // Définit l'image courante

  @override
  void initState() {
    // Initialise l'état du widget
    super.initState();
    currentImage = images[0]; // Choisi la première image par défaut
  }

  void changeImage() {
    // Définit la fonction qui change l'image
    setState(() {
      // Notifie le framework que l'état a changé
      int randomIndex =
          Random().nextInt(images.length); // Génère un index aléatoire
      currentImage =
          images[randomIndex]; // Choisi une image au hasard dans la liste
    });
  }

  void suivant() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => register3()),
    );
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
                        SvgPicture.asset('assets/Ellipse 12.svg'),
                        SvgPicture.asset('assets/Line.svg'),
                        SvgPicture.asset('assets/Ellipse 11.svg'),
                        SvgPicture.asset('assets/Line.svg'),
                        SvgPicture.asset('assets/Ellipse 12.svg'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                    horizontal: 12.0,
                    vertical: 10.0,
                  ),
                  child: GestureDetector(
                    onTap: changeImage,
                    child: Center(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: 210,
                        height: 210,
                        child: Container(
                          child: Image.asset(currentImage),
                          width: 200,
                          height: 200,
                        ),
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  child: GestureDetector(
                    onTap: changeImage,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: GestureDetector(
                            //onTap: Foget,
                            child: Image(
                              image: AssetImage('assets/pp.jpg'),
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage('assets/2.png'),
                            width: 70,
                            height: 70,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage('assets/3.png'),
                            width: 70,
                            height: 70,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage('assets/4.png'),
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  child: GestureDetector(
                    onTap: changeImage,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: GestureDetector(
                            //onTap: Foget,
                            child: Image(
                              image: AssetImage('assets/pp.jpg'),
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage('assets/2.png'),
                            width: 70,
                            height: 70,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage('assets/3.png'),
                            width: 70,
                            height: 70,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage('assets/4.png'),
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return register1();
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
