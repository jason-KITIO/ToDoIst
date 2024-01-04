import 'package:flutter/material.dart';
import 'package:todoist/Services/speech_services.dart';

class saisie extends StatefulWidget {
  const saisie({super.key});

  @override
  State<saisie> createState() => _saisieState();
}

class _saisieState extends State<saisie> {
  String _message = "Cliquer sur le bouton puis parler";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            _message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => SpeechService.toogleRecording(
            (value) => setState(() {
                  _message = value;
                }),
            (value) {}),
        child: Icon(Icons.mic),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
/*

 */
