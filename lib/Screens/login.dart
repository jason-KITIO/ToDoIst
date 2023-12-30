import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';

import 'Start.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 1,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GradientText(
                    Text("Login",
                        style: TextStyle(
                            fontSize: 90, fontWeight: FontWeight.bold)),
                    colors: [
                      Color(0xff283576),
                      Color(0xff6D7497),
                      Colors.white
                    ],
                    stops: [0, 0.5, 1],
                  ),
                  GradientText(
                    Text("Welcome Back",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    colors: [
                      Color(0xff283576),
                      Color(0xff6D7497),
                      Colors.white
                    ],
                    stops: [0, 0.5, 1],
                  ),
                ]),
            Padding(
              padding: EdgeInsets.all(20),
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
                          color: Colors.black.withOpacity(0.20000000298023224),
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
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200))),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Email ou Telephone",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.black.withOpacity(0.20000000298023224),
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
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200))),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                        );
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFD9D9D9)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Continue with social media",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              "Google",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              "Iphone",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    /*child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "J'ai deja un compte, ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "se connecter",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),*/
                    child: Center(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.transparent,
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        //onPrimary: Colors.orange.shade900,
                      ),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "J’ai pas encore de compte ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "Creer un compte",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Start()),
                        );
                      },
                    )),
                  ),
                  /* Center(
                      child: ElevatedButton(
                        child: Text('Ouvrir une autre page'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NouvellePage()),
                          );
                        },
                      ),
                    ),*/
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
