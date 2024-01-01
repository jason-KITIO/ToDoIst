import 'package:flutter/material.dart';
import 'package:todoist/Screens/route.dart';
// import 'package:flutter_gradient_text/flutter_gradient_text.dart';

import 'login.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Start2 extends StatefulWidget {
  const Start2({super.key});

  @override
  State<Start2> createState() => _StartState();
}

class _StartState extends State<Start2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            GradientText(
              'ToDoIst',
              style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
              gradientDirection: GradientDirection.ttb,
              colors: const [Colors.black, Colors.white],
              stops: [0, 1],
            ),
            Text("Bienvenue sur cette application de  gestion des taches",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => route()),
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
                  backgroundColor: MaterialStateProperty.all(Color(0xFFD9D9D9)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
