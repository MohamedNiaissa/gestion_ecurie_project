import 'package:flutter/material.dart';

import '../../controller/login.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  // déclaration des controllers pour le form de connexion
  TextEditingController username = new TextEditingController();
  TextEditingController mdp = new TextEditingController();

  final login_form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: login_form,
        child: Column(children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez entrer votre nom d'utilisateur ";
              }
              return null;
            },
            controller: username,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nom utilisateur',
            ),
          ),
          SizedBox(height: 15), // Espace entre les deux champs
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre mot de passe';
              }
              return null;
            },
            controller: mdp,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mot de passe',
            ),
          ),
          Center(
            child: TextButton(
              onPressed:  ()  async => {
                if (login_form.currentState!.validate())
                  {
                    if( await isUserThere()) {
                      Navigator.pop(context, 'OK')
                    } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Nom d'utilisateur et/ou mot de passe incorrect")),
                  )
                    }
                  },
              },
              child: const Text('Se connecter'),
            ),
          ),
        ]));
  }

  // Retourne vrai ou faux en fonction de l'existance de l'utilisateur en db
  Future<bool> isUserThere() async {
    return await loginUser(username.text, mdp.text);
  }
}
