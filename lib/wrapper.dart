import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Start.dart';
import 'Screens/login.dart';

class wrapper extends StatelessWidget {
  const wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // final _user = Provider.of<User>(context);
    /* if (_user == null) {
      return login();
    } else {*/
    return Start();
    //}
  }
}
