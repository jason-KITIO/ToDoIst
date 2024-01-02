import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoist/Screens/GUI/HomeUsers.dart';
import 'package:todoist/Screens/login.dart';
import 'package:todoist/Screens/register/register2.dart';

class register3 extends StatefulWidget {
  const register3({super.key});

  @override
  State<register3> createState() => _register3State();
}

class _register3State extends State<register3> {
  void suivant() {
    /*progress bar
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    Navigator.of(context).pop();*/
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeUsers()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          SvgPicture.asset('assets/Ellipse 12.svg'),
                          SvgPicture.asset('assets/Line.svg'),
                          SvgPicture.asset('assets/Ellipse 11.svg'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 200.0,
                    ),
                    child: Text(
                      'félicitation vous venez de creer votre compte',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
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
                                  return register2();
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
                ]),
          ),
        ),
      ),
    );
  }
}
