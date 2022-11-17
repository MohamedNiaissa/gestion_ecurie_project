import 'package:flutter/material.dart';

class FormConcours extends StatefulWidget {
  const FormConcours({Key? key}) : super(key: key);


  @override
  State<FormConcours> createState() => _FormConcoursState();
}

class _FormConcoursState extends State<FormConcours> {
  TextEditingController nomConcours = new TextEditingController();
  TextEditingController specialite = new TextEditingController();
  TextEditingController adresse = new TextEditingController();
  TextEditingController photo = new TextEditingController();
  TextEditingController date = new TextEditingController();
  //TextEditingController participants = new TextEditingController();

  final concours_form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: concours_form,
        child: Column(children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez entrer le nom du coucours ";
              }
              return null;
            },
            controller: nomConcours,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nom du concours',
            ),
          ),
          SizedBox(height: 15), // Espace entre les deux champs
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer la specialite';
              }
              return null;
            },
            controller: specialite,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mot de passe',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer la specialite';
              }
              return null;
            },
            controller: adresse,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'adresse',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez entrer l'adresse";
              }
              return null;
            },
            controller: photo,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Lien photo',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le lien photo';
              }
              return null;
            },
            controller: photo,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Lien photo',
            ),
          ),
          Center(
            child: TextButton(
              onPressed:  ()  async => {
                if (concours_form.currentState!.validate())
                  {
                      Navigator.pop(context, 'OK')
                  },
              },
              child: const Text('Créer'),
            ),
          ),
        ]));
  }
}
