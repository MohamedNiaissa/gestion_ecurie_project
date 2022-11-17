import 'package:flutter/material.dart';
import 'package:gestion_ecurie/controller/actualites_controller.dart';
import 'package:gestion_ecurie/view/pages/signup_popup.dart';
import 'package:go_router/go_router.dart';

import '../shared/navbar.dart';
import 'FormLogin.dart';

class HorseStable extends StatefulWidget {
  const HorseStable({super.key, required this.title});

  final String title;

  @override
  State<HorseStable> createState() => _HorsePageStable();
}

class _HorsePageStable extends State<HorseStable> {

  void _newEvent() {
    ActualitesController.insert();
    // ajoute une fausse inscription aux actualités
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Navbar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have created this many events:',
            ),
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

          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: _newEvent,
        tooltip: 'new event',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
