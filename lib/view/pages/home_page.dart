import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestion_ecurie/controller/actualites_controller.dart';
import 'package:gestion_ecurie/view/pages/signup_popup.dart';
import 'package:gestion_ecurie/backend/local_storage.dart';
import 'package:go_router/go_router.dart';

import 'FormLogin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  clearLocalStorage() {
    setState(() {
      LocalStorageHelper.clearAll();
    });
  }
  void _newEvent() {
    ActualitesController.insert();
    // ajoute une fausse inscription aux actualités
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Image.asset('assets/img/unicorn_logo.png'),
              onPressed :() => context.go('/')),

          IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
// Ici je créer la popup qui affichera le formulaire de création de compte
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          clipBehavior: Clip.none, children: <Widget>[
                          SignupPop()
                        ],
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
                actions: <Widget>[
                  FormLogin()
                ],
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have created this many events:',
            ),
            ElevatedButton(onPressed: clearLocalStorage(),
                child: const Icon(Icons.add))
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text("Les chevaux de l'écurie"),
              onTap: () {
                return context.go('/horse_page');
              },
            ),
            ListTile(
              title: const Text('Les événements prévues'),
              onTap: () {
                return context.go('/event_stable');

              },
            )
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: _newEvent,
        tooltip: 'new event',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
