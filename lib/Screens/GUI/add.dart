import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:hive/hive.dart';
import 'package:todoist/Screens/GUI/home.dart';
import 'package:todoist/Screens/register/register1.dart';
import 'package:todoist/Screens/route.dart';

import '../../model/add_date.dart';
import '../ForgetPassword.dart';
import 'HomeUsers.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  DateTime date = new DateTime.now();
  String? selctedItem;

  final List<String> _item = [
    'food',
    "money transfer",
    "Transportation",
    "Education"
  ];

  final _motifController = TextEditingController();
  final _DescriptionController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  Future signIn() async {
    try {
      addMotifDetails(
        _motifController.text.trim(),
        _DescriptionController.text.trim(),
        selctedItem!,
        user.email!,
        // si on utilise un entier on aura
        //int.parse(_FullNameController.text.trim()),
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

  Future addMotifDetails(
      String motif, String Description, String choix, String email) async {
    await FirebaseFirestore.instance.collection('Tache').add({
      'Motif': motif,
      'Description': Description,
      'choix': choix,
      'date': date,
      'email': email,
    });
  }

  @override
  void dispose() {
    _motifController.dispose();
    _DescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Ajouter',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                /*FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Start()),
              );*/
              },
              child: Icon(Icons.more_horiz),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30.0),
                      child: Container(
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
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
                                                    color:
                                                        Colors.grey.shade200))),
                                        child: TextField(
                                          controller: _motifController,
                                          decoration: InputDecoration(
                                              hintText: "Motif",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
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
                                                    color:
                                                        Colors.grey.shade200))),
                                        child: TextField(
                                          controller: _DescriptionController,
                                          decoration: InputDecoration(
                                              hintText: "Description",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
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
                            SizedBox(height: 10),
                            name(),
                            SizedBox(height: 30),
                            date_time(),
                            SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                                      "Ajouter",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Color(0xffC5C5C5)),
        color: Colors.white,
      ),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          'Date : ${date.year} / ${date.day} / ${date.month}',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container name() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Color(0xffC5C5C5),
            ),
          ),
          child: DropdownButton<String>(
            value: selctedItem,
            onChanged: ((value) {
              setState(() {
                selctedItem = value!;
              });
            }),
            items: _item
                .map((e) => DropdownMenuItem(
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              child: Icon(Icons.cleaning_services),
                            ),
                            SizedBox(width: 10),
                            Text(
                              e,
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            selectedItemBuilder: (BuildContext context) => _item
                .map((e) => Row(
                      children: [
                        Container(
                          width: 42,
                          child: Icon(Icons.cleaning_services),
                        ),
                        SizedBox(width: 5),
                        Text(e)
                      ],
                    ))
                .toList(),
            hint: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                'Motif',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
          ),
        ),
      ),
    );
  }
}
