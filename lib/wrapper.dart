import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/Screens/Start2.dart';

import 'Screens/Start.dart';
import 'Screens/GUI/HomeUsers.dart';
import 'Screens/login.dart';
import 'Screens/route.dart';

class wrapper extends StatelessWidget {
  const wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Start2();
          } else {
            return Start();
          }
        },
      ),
    );
  }
}
