import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_ecurie/backend/local_storage.dart';

import '../../models/user.dart';

class InfosUser extends StatefulWidget {
  const InfosUser({Key? key}) : super(key: key);

  @override
  State<InfosUser> createState() => _InfosUserState();
}

class _InfosUserState extends State<InfosUser> {
  TextEditingController username = new TextEditingController();
  TextEditingController userPhoto = new TextEditingController();
  TextEditingController userMail = new TextEditingController();
  TextEditingController dateNaiss = new TextEditingController();
  TextEditingController userPhone = new TextEditingController();
  TextEditingController profilFFE = new TextEditingController();
  //var userInfoString = LocalStorageHelper.getValue("tokenUser");

  Map<String, dynamic> user =
      jsonDecode(LocalStorageHelper.getValue("tokenUser").substring(4));


  @override
  Widget build(BuildContext context) {
    username.text = user["username"];
    userPhoto.text = user["userPhoto"];
    userMail.text = user["userMail"];


    if(user["dateNaiss"] == null) {
      dateNaiss.text = "non renseigné";
    }

    if(user["userPhone"] == null) {
      userPhone.text = "non renseigné";
    }

    if(user["profilFFE"] == null) {
      profilFFE.text = "non renseigné";
    }

    final _formKey = GlobalKey<FormState>();
    return Column(
      children: [
        //TextField(controller: TextEditingController()..text = 'Your initial value'),
        Text("Bienvenue dans votre profil"),
        Text('Vos information'),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //Text(user["dateNaiss"]),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: userPhoto,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: dateNaiss,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: userMail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: userPhone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: profilFFE,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Modifier mes informations'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
