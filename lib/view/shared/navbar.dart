import 'package:flutter/material.dart';

import '../../backend/local_storage.dart';
import '../pages/FormLogin.dart';
import '../pages/profil.dart';
import '../pages/signup_popup.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    if (LocalStorageHelper.getValue("tokenUser") == null) {
      return AppBar(
        title: Text("App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh), onPressed: () => setState(() {})),
          IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
// Ici je créer la popup qui affichera le formulaire de création de compte
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[SignupPop()],
                        ),
                      );
                    });
              }),
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                // déclaration de la pop up
                title: Center(child: const Text('Connexion')),
                actions: <Widget>[FormLogin()],
              ),
            ),
          )
        ],
      );
    } else {
      return AppBar(
        title: Text("App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh), onPressed: () => setState(() {})),
          IconButton(
              onPressed: () => {
                    Navigator.of(context)
                        .pushNamed(Profil.tag)
                        .then((_) => setState(() {}))
                  },
              icon: Icon(Icons.person)),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                setState(() {
                  LocalStorageHelper.clearAll();
                });
              }),
        ],
      );
    }
  }
}
