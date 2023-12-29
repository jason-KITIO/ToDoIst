import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientText(
          'Bonjour Flutter',
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          colors: [
            Colors.blue,
            Colors.red,
            Colors.teal,
          ],
          gradientDirection: GradientDirection.rtl, // L'itérateur qui change la direction du dégradé
          //transform: GradientRotation(30 * pi / 180), // La transformation qui fait tourner le dégradé de 30 degrés
        ),
      ),
    );
  }
}
