import 'package:flutter/material.dart';
import 'package:gestion_ecurie/controller/actualites_controller.dart';
import 'package:gestion_ecurie/view/pages/signup_popup.dart';
import 'package:go_router/go_router.dart';

import '../../models/horse.dart';
import '../shared/drawer.dart';
import '../shared/navbar.dart';
import 'FormLogin.dart';
import 'form_horse.dart';

class HorseStable extends StatefulWidget {
  const HorseStable({super.key, required this.title});

  final String title;

  @override
  State<HorseStable> createState() => _HorsePageStable();
}

class _HorsePageStable extends State<HorseStable> {
 List <Horse> horse = [];
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Stack(
                        clipBehavior: Clip.none, children: <Widget>[
                        SingleChildScrollView(
                         child: AddHorse()
                        )
                      ],
                      ),
                    );
                  });
            }, child: Text('ajouter un cheval')),
          ],
        ),
      ),
      drawer: DrawerComponent(),
      floatingActionButton: FloatingActionButton(
        onPressed: _newEvent,
        tooltip: 'new event',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
