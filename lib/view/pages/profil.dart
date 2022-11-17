import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gestion_ecurie/view/pages/infosUser.dart';

import '../../backend/local_storage.dart';
class Profil extends StatefulWidget {
  static const tag = "profil page";

  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma Page de Profil"),
      ),
      body: Center(
        child: Column(
          children: [
            InfosUser()
          ],
        ),
      ),
    );
  }
}
