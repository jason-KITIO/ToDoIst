import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoist/Screens/GUI/add.dart';

class tache extends StatefulWidget {
  const tache({super.key});

  @override
  State<tache> createState() => _tacheState();
}

class _tacheState extends State<tache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Container(
                //color: Colors.red,
                width: 300,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder(
                          // Appeler la fonction afficherDonnees() ici
                          future: afficherMotif(),
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
                        FutureBuilder(
                          // Appeler la fonction afficherDonnees() ici
                          future: afficherChoix(),
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
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => add()),
                        );
                      },
                      child: Icon(Icons.delete),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<Widget> afficherMotif() async {
    // Obtenir l'utilisateur actuel et son email
    final user = FirebaseAuth.instance.currentUser!;
    final email = user.email!;

    // Créer une requête sur la collection avec un filtre sur l'email
    Query query = FirebaseFirestore.instance
        .collection('Tache')
        .where('email', isEqualTo: email);

    // Exécuter la requête et obtenir les documents
    QuerySnapshot snapshot = await query.get();

    // Créer une liste vide pour stocker les widgets Text
    List<Widget> textWidgets = [];

    // Parcourir les documents et ajouter un widget Text à la liste pour chaque champ "Motif"
    for (DocumentSnapshot document in snapshot.docs) {
      // Obtenir le contenu du champ "Motif"
      String Motif = document.get("Motif");
      // Créer un widget Text avec le contenu du champ
      var textWidget = Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          '$Motif',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
      // Ajouter le widget Text à la liste
      textWidgets.add(textWidget);
    }

    // Retourner un widget Column qui contient tous les widgets Text de la liste
    return Column(
      children: textWidgets,
    );
  }

  Future<Widget> afficherChoix() async {
    // Obtenir l'utilisateur actuel et son email
    final user = FirebaseAuth.instance.currentUser!;
    final email = user.email!;

    // Créer une requête sur la collection avec un filtre sur l'email
    Query query = FirebaseFirestore.instance
        .collection('Tache')
        .where('email', isEqualTo: email);

    // Exécuter la requête et obtenir les documents
    QuerySnapshot snapshot = await query.get();

    // Créer une liste vide pour stocker les widgets Text
    List<Widget> textWidgets = [];

    // Parcourir les documents et ajouter un widget Text à la liste pour chaque champ "choix"
    for (DocumentSnapshot document in snapshot.docs) {
      // Obtenir le contenu du champ "choix"
      String choix = document.get("choix");
      // Créer un widget Text avec le contenu du champ
      var textWidget = Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          '$choix',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
      // Ajouter le widget Text à la liste
      textWidgets.add(textWidget);
    }

    // Retourner un widget Column qui contient tous les widgets Text de la liste
    return Column(
      children: textWidgets,
    );
  }

  Future<Widget> afficherDescription() async {
    // Obtenir l'utilisateur actuel et son email
    final user = FirebaseAuth.instance.currentUser!;
    final email = user.email!;

    // Créer une requête sur la collection avec un filtre sur l'email
    Query query = FirebaseFirestore.instance
        .collection('Tache')
        .where('email', isEqualTo: email);

    // Exécuter la requête et obtenir les documents
    QuerySnapshot snapshot = await query.get();

    // Créer une liste vide pour stocker les widgets Text
    List<Widget> textWidgets = [];

    // Parcourir les documents et ajouter un widget Text à la liste pour chaque champ "Description"
    for (DocumentSnapshot document in snapshot.docs) {
      // Obtenir le contenu du champ "Description"
      String Description = document.get("Description");
      // Créer un widget Text avec le contenu du champ
      var textWidget = Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          '$Description',
          textAlign: TextAlign.left,
        ),
      );
      // Ajouter le widget Text à la liste
      textWidgets.add(textWidget);
    }

    // Retourner un widget Column qui contient tous les widgets Text de la liste
    return Column(
      children: textWidgets,
    );
  }

  // Créer une fonction qui supprime un document de la firebase
  void supprimerDocument() async {
    // Obtenir l'utilisateur actuel et son email
    final user = FirebaseAuth.instance.currentUser!;
    final email = user.email!;

    // Créer une requête sur la collection avec un filtre sur l'email
    Query query = FirebaseFirestore.instance
        .collection('Tache')
        .where('email', isEqualTo: email);

    // Exécuter la requête et obtenir les documents
    QuerySnapshot snapshot = await query.get();

    // Créer une liste vide pour stocker les widgets Text
    List<Widget> textWidgets = [];

    String valeur = 'hello';
    for (DocumentSnapshot document in snapshot.docs) {
      // Obtenir le contenu du champ "Motif"
      String Motif = document.get("Motif");
      Text textWidget = Text(
        '$Motif',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
      valeur = '$Motif';
    }
    // Créer une référence à la collection "test"
    var colRef = FirebaseFirestore.instance.collection('Tache');

    // Créer une requête qui filtre les documents selon le champ "nom"
    var query2 = colRef.where('Motif', isEqualTo: valeur);

    // Obtenir les documents qui correspondent à la requête
    var snapshot2 = await query2.get();

    // Parcourir les documents et les supprimer de la firebase
    for (var doc in snapshot2.docs) {
      await doc.reference.delete();
    }

    // Afficher un message de confirmation
    print('Documents supprimés avec succès');
  }
}
