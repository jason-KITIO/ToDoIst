import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:todoist/Screens/login.dart';
import 'package:todoist/Screens/register/register1.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _emailController = TextEditingController();
  final _passwwordController = TextEditingController();
  final _passwordControllerConfirm = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwwordController.dispose();
    _passwordControllerConfirm.dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwwordController.text.trim(),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => register1()),
        );
      }
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

  void signUp1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => register1()),
    );
  }

  bool passwordConfirmed() {
    if (_passwwordController.text.trim() ==
        _passwordControllerConfirm.text.trim()) {
      return true;
    } else {
      return false;
    }
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GradientText(
                        Text("Sign up",
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
                        Text("Welcome",
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
                SizedBox(
                  height: 25,
                ),
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
                              color:
                              Colors.black.withOpacity(0.20000000298023224),
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
                                controller: _emailController,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    hintText: "Email",
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
                              color:
                              Colors.black.withOpacity(0.20000000298023224),
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
                                obscureText: obscureText,
                                controller: _passwwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    // Avec une icône
                                    icon: Icon(
                                      // Qui affiche un œil ouvert ou fermé selon la valeur de obscureText
                                      obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed:
                                    toggleObscureText, // Qui appelle la fonction toggleObscureText quand on appuie dessus
                                  ),
                                ),
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
                              color:
                              Colors.black.withOpacity(0.20000000298023224),
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
                                obscureText: obscureText,
                                controller: _passwordControllerConfirm,
                                decoration: InputDecoration(
                                  labelText: 'Confirm password',
                                  hintText: "Confirm password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    // Avec une icône
                                    icon: Icon(
                                      // Qui affiche un œil ouvert ou fermé selon la valeur de obscureText
                                      obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed:
                                    toggleObscureText, // Qui appelle la fonction toggleObscureText quand on appuie dessus
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: GestureDetector(
                          onTap: signUp,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0x3F283576),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                                    "J’ai deja un compte ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    "se connecter",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()),
                                );
                              },
                            )),
                      ),
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
