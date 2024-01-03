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
        title: Text('Recherche dans Firebase'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Rechercher',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchDocuments,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = _searchResults[index];
                // Afficher les résultats de la recherche ici
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
