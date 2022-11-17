import 'package:flutter/material.dart';
import 'package:gestion_ecurie/view/shared/drawer.dart';
import 'package:go_router/go_router.dart';

import '../shared/navbar.dart';
import 'form_concours.dart';

class FormsEvent extends StatefulWidget {
  const FormsEvent({Key? key}) : super(key: key);

  @override
  State<FormsEvent> createState() => _FormsEventState();
}

class _FormsEventState extends State<FormsEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Navbar(),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text("Créer un concours"),
            SizedBox(height: 15),
            FormConcours()
          ],
            ),
        ),
      drawer: DrawerComponent()
    );
  }
}
