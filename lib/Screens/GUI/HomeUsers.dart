import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoist/Screens/Start.dart';
import 'package:todoist/Screens/register/register1.dart';
import 'package:todoist/Screens/register/register3.dart';
import 'package:todoist/read%20data/get_user_name.dart';

import '../../model/add_date.dart';

class HomeUsers extends StatefulWidget {
  const HomeUsers({super.key});

  @override
  State<HomeUsers> createState() => _homeState();
}

class _homeState extends State<HomeUsers> {
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
                                  child: Image.asset('assets/pp.jpg'),
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
                  )
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

/*
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  var history;
  final box = Hive.box<Add_data>('data');
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 340, child: _head()),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transactions History',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          history = box.values.toList()[index];
                          return getList(history, index);
                        },
                        childCount: box.length,
                      ),
                    )
                  ],
                );
              })),
    );
  }

  Widget getList(Add_data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (Tab) {
          history.delete();
        },
        child: get(index, history));
  }

  ListTile get(int index, Add_data history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset('images/${history.name}.png', height: 40),
      ),
      title: Text(
        history.name,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${day[history.datetime.weekday - 1]}  ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        history.amount,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color: history.IN == 'Income' ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: Color(0xff368983),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    left: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Color.fromRGBO(250, 250, 250, 0.1),
                        child: Icon(
                          Icons.notification_add_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good afternoon',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 224, 223, 223),
                          ),
                        ),
                        Text(
                          'Enjelin Morgeana',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 140,
          left: 20,
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(47, 125, 121, 0.3),
                  offset: Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: 6,
                ),
              ],
              color: Color.fromARGB(255, 47, 125, 121),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        'total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Color.fromARGB(255, 85, 145, 141),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Income',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Color.fromARGB(255, 85, 145, 141),
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Expenses',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'income',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'expenses',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
*/
