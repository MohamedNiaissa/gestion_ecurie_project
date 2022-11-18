import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_ecurie/backend/local_storage.dart';

import '../../controller/update.dart';
import '../../models/user.dart';
import '../../services/update.dart';

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
              ElevatedButton(
                onPressed: () {
                  updateUser("username",user["username"], "username" ,username.text);
                },
                child: const Text("Modifier mon nom d'utilisateur"),
              ),
              Text(userPhoto.text),
              TextField(
                controller: userPhoto,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  updateData("username", user["username"],"userPhoto" , userPhoto.text);
                },
                child: const Text("Modifier ma photo d'utilisateur"),
              ),
              TextField(
                controller: dateNaiss,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  updateData("username", user["username"], "dateNaiss", dateNaiss.text);
                },
                child: const Text("Modifier ma date de naissance"),
              ),
              TextField(
                controller: userMail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  updateData("username", user["username"],"userMail", userMail.text);
                },
                child: const Text("Modifier mon email"),
              ),
              TextField(
                controller: userPhone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  updateData("username", user["username"], "userPhone",userPhone.text);
                },
                child: const Text("Modifier mon numero de telephone"),
              ),
              TextField(
                controller: profilFFE,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  updateData("username", user["username"], "profilFFE",profilFFE.text);
                },
                child: const Text("Modifier mon lien de profil FFE"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
