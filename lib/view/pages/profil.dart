import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gestion_ecurie/view/pages/infosUser.dart';
import 'package:gestion_ecurie/view/shared/drawer.dart';

import '../../backend/local_storage.dart';
import '../shared/navbar.dart';
class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
            InfosUser()
          ],
        ),
      ),
      drawer: DrawerComponent(),
    );
  }
}
