import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:todoist/Screens/GUI/HomeUsers.dart';
import 'package:todoist/Screens/register.dart';
import 'package:todoist/Screens/route.dart';
import 'package:todoist/google_auth_cubit.dart';
import 'package:todoist/google_auth_state.dart';

import 'ForgetPassword.dart';
import 'Start.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _emailController = TextEditingController();
  final _passwwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwwordController.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route()),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Nous recontrons un probleme de Connection\n"
                  "  - Veillez vous rassurer d'avoir remplit tous les champs\n\n"
                  "  - Veriifier votre connection internet\n\n"
                  "                     Merci de coopération "),
            );
          });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwwordController.dispose();
    super.dispose();
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
                SizedBox(
                  height: 30,
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
                      /*Row(
                        // Le checkbox
                        children: [
                          // Avec deux enfants
                          Checkbox(
                            // Le checkbox lui-même
                            value: checkboxValue,
                            // Qui utilise la valeur de checkboxValue
                            onChanged: (value) {
                              // Qui appelle la fonction toggleObscureText quand on change sa valeur
                              toggleObscureText();
                            },
                          ),
                          Text('Afficher le mot de passe'),
                          // Le texte associé au checkbox
                        ],
                      ),*/
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ForgetPassword();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Mots de passe oublier ? ',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: GestureDetector(
                          onTap: signIn,
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
                      BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: state is GoogleAuthLoadingState
                                ? null
                                : () => context
                                    .read<GoogleAuthCubit>()
                                    .login(context),
                            child: state is GoogleAuthLoadingState
                                ? const CircularProgressIndicator()
                                : const Text("Connexion avec Google"),
                          );
                        },
                        listener: (context, state) {},
                      ),
                      /*Row(
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
                      ),*/
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
                              MaterialPageRoute(
                                  builder: (context) => register()),
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
        ),
      ),
    );
  }
}
