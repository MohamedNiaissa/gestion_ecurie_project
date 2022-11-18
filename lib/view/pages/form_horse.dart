import 'package:flutter/material.dart';

import '../../controller/new_horse.dart';
import '../../services/signup_service.dart';
import '../../controller/signup_actualities.dart';

class AddHorse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyNewHorse();
}

class _MyNewHorse extends State<AddHorse> {
  final horsenameController = TextEditingController();
  final horsecoatController = TextEditingController();
  final horseraceController = TextEditingController();
  final horsesexeController = TextEditingController();
  final horsespecialityController = TextEditingController();
  final horsePPController = TextEditingController();
  final horsebirthController = TextEditingController();
  final usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nom',
            ),
            controller: horsenameController,
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 3.0)),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Le champ doit être remplie';
              }
              return null;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'robe du cheval'),
            controller: horsecoatController,
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 3.0)),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ doit être remplie';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'race du cheval'),
              controller: horseraceController),
          Padding(padding: const EdgeInsets.symmetric(vertical: 3.0)),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ doit être remplie';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'sexe'),
              controller: horsesexeController),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ doit être remplie';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'spécialité'),
              controller: horsespecialityController),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ doit être remplie';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'photo'),
              controller: horsePPController),

          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ doit être remplie';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'date de naissance'),
              controller: horsebirthController),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champ doit être remplie';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'propriétaire'),
              controller: usernameController),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              /* vérifie que tous les champ du formulaire sont valide
                appel la fonction Signup et envoie en argument les inputs
              * */
              if (_formKey.currentState!.validate()) {
                String horsename = horsenameController.text;
                String horsecoat = horsecoatController.text;
                String horserace = horseraceController.text;
                String horsesexe = horsesexeController.text;
                String horsespeciality = horsespecialityController.text;
                String horsePP = horsePPController.text;
                String horsebirth = horsebirthController.text;
                String username = usernameController.text;
                NewHorse(horsename, horsecoat,horserace,horsesexe,horsespeciality,horsePP,horsebirth,username
                );
                //_insciptionEventCard(username,profilePictureController.text);
                Navigator.pop(context);
              }
            },
            child: Text('submit'),
          )
        ]));
  }
}


