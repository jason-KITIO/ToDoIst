import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];

  void _searchDocuments() async {
    String searchText = _searchController.text.trim();

    if (searchText.isNotEmpty) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Tache')
          .where('Motif', isEqualTo: searchText)
          .get();

      setState(() {
        _searchResults = querySnapshot.docs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche une tache a partir du motif'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Colors.black.withOpacity(0.20000000298023224),
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
                            bottom: BorderSide(color: Colors.grey.shade200))),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Rechercher',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: _searchDocuments,
                        ),
                      ),
                      // Ajoutez le paramètre onSubmitted
                      onSubmitted: (value) {
                        // Exécutez la fonction _searchDocuments
                        _searchDocuments();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              // Si la liste est vide, afficher un seul élément
              itemCount: _searchResults.isEmpty ? 1 : _searchResults.length,
              itemBuilder: (context, index) {
                // Si la liste est vide, afficher le message
                if (_searchResults.isEmpty) {
                  return Center(
                    child: Text('Rien n\'a été trouvé'),
                  );
                }
                // Sinon, afficher les résultats de la recherche
                DocumentSnapshot document = _searchResults[index];
                return ListTile(
                  title: Text(document['Motif']),
                  subtitle: Text(document['Description']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
