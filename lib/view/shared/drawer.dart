import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
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
            title: const Text("Créer un événement"),
            onTap: () {
              return context.go('/creer_evenement');
            },
          ),
        ])); // This trailing comma makes auto-formatting nicer for build methods.;
  }
}
