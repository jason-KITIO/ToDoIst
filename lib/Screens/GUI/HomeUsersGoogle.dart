import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoist/Screens/GUI/HomeUsers.dart';
import 'package:todoist/Screens/Start.dart';
import 'package:todoist/Screens/register/register1.dart';
import 'package:todoist/Screens/register/register3.dart';
import 'package:todoist/Screens/route.dart';
import 'package:todoist/read%20data/get_user_name.dart';

import '../../model/add_date.dart';

class HomeUsersGoogle extends StatefulWidget {
  const HomeUsersGoogle({super.key});

  @override
  State<HomeUsersGoogle> createState() => _homeState();
}

class _homeState extends State<HomeUsersGoogle> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIds = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIds.add(element.reference.id);
            }));
  }

// Définir une fonction qui prend en paramètre le nom de la collection

/*
  @override
  void initState() {
    getDocId();
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text(user.email!),
          actions: [
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Start()),
                );
              },
              child: Icon(Icons.logout_outlined),
            )
          ],
        ),*/
        body: SafeArea(
      child: Expanded(
        child: Column(
          children: [
            /*Text('l\'utilisateur connecter a pour email : ' + user.email!),
                MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  color: Color(0x3F283576),
                  child: Text('Sign Out'),
                ),
                Expanded(
                    child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      //itemCount: 2,
                      itemCount: docIds.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: GetUserName(documentId: docIds[index]),
                            tileColor: Colors.grey.shade100,
                          ),
                        );
                      },
                    );
                  },
                )),
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
                ),*/

            Container(
              //color: Colors.red,
              child: Stack(
                // L'alignement des widgets dans le stack
                alignment: Alignment.center,
                // La liste des widgets à afficher dans le stack
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 90.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 228,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 99.0),
                    child: Positioned(
                      child: Align(
                        alignment: FractionalOffset.center,
                        // La position du widget par rapport au centre du stack
                        // Vous pouvez utiliser des valeurs positives ou négatives
                        // Le widget à positionner
                        // Vous pouvez utiliser Image.asset ou Image.network comme avant
                        child: Stack(
                          // L'alignement des widgets dans le stack
                          alignment: Alignment.center,
                          // La liste des widgets à afficher dans le stack
                          children: <Widget>[
                            // Le premier widget est en bas du stack
                            // Vous pouvez utiliser Image.asset pour charger une image locale
                            // Ou Image.network pour charger une image depuis une URL
                            Image.asset('assets/Ellipse 21.png'),
                            // Le deuxième widget est au-dessus du premier
                            // Vous pouvez utiliser Positioned pour positionner le widget dans le stack
                            Positioned(
                              // La position du widget par rapport au centre du stack
                              // Vous pouvez utiliser des valeurs positives ou négatives
                              left: 15,
                              top: 15,
                              // Le widget à positionner
                              // Vous pouvez utiliser Image.asset ou Image.network comme avant
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  child: Image.network(
                                    '${user.photoURL}',
                                    fit: BoxFit.cover,
                                  ),
                                  width: 190,
                                  height: 190,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Un widget Stack permet de superposer un widget sur un autre
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset('assets/8 1.png'),
                          ),
                        ),
                        Text(
                          '${user.displayName}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        FutureBuilder(
                          // Appeler la fonction afficherDonnees() ici
                          future: afficherUsername(),
                          // Définir le widget à afficher selon l'état du futur
                          builder: (context, snapshot) {
                            // Si le futur est terminé avec succès, afficher le widget Column retourné par la fonction
                            if (snapshot.hasData) {
                              return snapshot.data!;
                            }
                            // Si le futur est en attente, afficher un widget CircularProgressIndicator
                            else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            // Si le futur a échoué, afficher un widget Text avec le message d'erreur
                            else if (snapshot.hasError) {
                              return Text('Erreur : ${snapshot.error}');
                            }
                            // Sinon, afficher un widget Text vide
                            else {
                              return Text('');
                            }
                          },
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset('assets/6.png'),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // If the user is signed in and has a phone number, show it
                            if (user.phoneNumber != null)
                              Text(
                                '${user.phoneNumber}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            // Otherwise, show a message
                            if (user.phoneNumber == null)
                              Text(
                                'Numero de telephone introuvable',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                          ],
                        ),
                        FutureBuilder(
                          // Appeler la fonction afficherDonnees() ici
                          future: afficherFullName(),
                          // Définir le widget à afficher selon l'état du futur
                          builder: (context, snapshot) {
                            // Si le futur est terminé avec succès, afficher le widget Column retourné par la fonction
                            if (snapshot.hasData) {
                              return snapshot.data!;
                            }
                            // Si le futur est en attente, afficher un widget CircularProgressIndicator
                            else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            // Si le futur a échoué, afficher un widget Text avec le message d'erreur
                            else if (snapshot.hasError) {
                              return Text('Erreur : ${snapshot.error}');
                            }
                            // Sinon, afficher un widget Text vide
                            else {
                              return Text('');
                            }
                          },
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset('assets/7.png'),
                          ),
                        ),
                        Text(
                          user.email!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset('assets/4 1.png'),
                          ),
                        ),
                        Text(
                          'Tache',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            /*Center(
              // Utiliser un widget FutureBuilder pour attendre le résultat de la fonction afficherDonnees()
              child: FutureBuilder(
                // Appeler la fonction afficherDonnees() ici
                future: afficherUsername(),
                // Définir le widget à afficher selon l'état du futur
                builder: (context, snapshot) {
                  // Si le futur est terminé avec succès, afficher le widget Column retourné par la fonction
                  if (snapshot.hasData) {
                    return snapshot.data!;
                  }
                  // Si le futur est en attente, afficher un widget CircularProgressIndicator
                  else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  // Si le futur a échoué, afficher un widget Text avec le message d'erreur
                  else if (snapshot.hasError) {
                    return Text('Erreur : ${snapshot.error}');
                  }
                  // Sinon, afficher un widget Text vide
                  else {
                    return Text('');
                  }
                },
              ),
            ),*/
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoogleSignIn().signOut();
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Start()),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            child: Text(
                              'Se Deconnecter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        Icon(Icons.logout_outlined),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<Widget> afficherUsername() async {
    // Obtenir l'utilisateur actuel et son email
    final user = FirebaseAuth.instance.currentUser!;
    final email = user.email!;

    // Créer une requête sur la collection avec un filtre sur l'email
    Query query = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: email);

    // Exécuter la requête et obtenir les documents
    QuerySnapshot snapshot = await query.get();

    // Créer une liste vide pour stocker les widgets Text
    List<Widget> textWidgets = [];

    // Parcourir les documents et ajouter un widget Text à la liste pour chaque champ "Username"
    for (DocumentSnapshot document in snapshot.docs) {
      // Obtenir le contenu du champ "Username"
      String username = document.get("Username");
      // Créer un widget Text avec le contenu du champ
      Text textWidget = Text(
        '$username',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
      // Ajouter le widget Text à la liste
      textWidgets.add(textWidget);
    }

    // Retourner un widget Column qui contient tous les widgets Text de la liste
    return Column(
      children: textWidgets,
    );
  }

  Future<Widget> afficherFullName() async {
    // Obtenir l'utilisateur actuel et son email
    final user = FirebaseAuth.instance.currentUser!;
    final email = user.email!;

    // Créer une requête sur la collection avec un filtre sur l'email
    Query query = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: email);

    // Exécuter la requête et obtenir les documents
    QuerySnapshot snapshot = await query.get();

    // Créer une liste vide pour stocker les widgets Text
    List<Widget> textWidgets = [];

    // Parcourir les documents et ajouter un widget Text à la liste pour chaque champ "Username"
    for (DocumentSnapshot document in snapshot.docs) {
      // Obtenir le contenu du champ "Username"
      String username = document.get("Nom et prenom");
      // Créer un widget Text avec le contenu du champ
      Text textWidget = Text(
        '$username',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
      // Ajouter le widget Text à la liste
      textWidgets.add(textWidget);
    }

    // Retourner un widget Column qui contient tous les widgets Text de la liste
    return Column(
      children: textWidgets,
    );
  }
}

/*Figma
 Container(
      width: 430,
      height: 932,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 859,
            child: Container(
              width: 430,
              height: 73,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F283576),
                    blurRadius: 4,
                    offset: Offset(0, -7),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 333,
            top: 821,
            child: Container(
              width: 87,
              height: 87,
              decoration: ShapeDecoration(
                color: Color(0xFF283576),
                shape: OvalBorder(),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(5, -5),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(-5, -5),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(-5, 5),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(5, 5),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 49,
            top: 880,
            child: Container(
              width: 29,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/29x31"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 363,
            top: 849,
            child: Container(
              width: 27.76,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/28x31"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 216.39,
            top: 874,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/42x42"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 147,
            top: 881,
            child: Container(
              width: 31.39,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/31x31"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 296.39,
            top: 881,
            child: Container(
              width: 28.45,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/28x31"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 430,
              height: 237,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/430x237"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 113,
            top: 99,
            child: Container(
              width: 201,
              height: 201,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: OvalBorder(),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(5, -5),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(-5, -5),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(-5, 5),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(5, 5),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 21,
            top: 337,
            child: Container(
              width: 27,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/27x31"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 21,
            top: 535,
            child: Container(
              width: 27,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/27x31"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 363,
            top: 160,
            child: Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.3700000047683716),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 373,
            top: 169,
            child: Container(
              width: 31,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/31x31"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 85,
            top: 344,
            child: Text(
              'Jason Kitio',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 84,
            top: 476,
            child: Text(
              'kanamax00@gmail.com',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 85,
            top: 410,
            child: Text(
              '+237 696 354 128',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 84,
            top: 539,
            child: Text(
              'Mes Taches',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 194,
            top: 751,
            child: Text(
              'Se Deconnecter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 119,
            top: 105,
            child: Container(
              width: 189.74,
              height: 190,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/190x190"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            left: 21,
            top: 406,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/30x30"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 21,
            top: 474,
            child: Container(
              width: 31,
              height: 23,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/31x23"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 396,
            top: 558,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(-3.14),
              child: Container(
                width: 15,
                height: 15,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: StarBorder.polygon(sides: 3),
                ),
              ),
            ),
          ),
          Positioned(
            left: 369,
            top: 751,
            child: Container(
              width: 24,
              height: 24,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(children: []),
            ),
          ),
        ],
      ),
    );
 */
