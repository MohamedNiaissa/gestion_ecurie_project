import 'package:flutter/material.dart';

import '../../services/signup_service.dart';
import '../../controller/signup_actualities.dart';

class SignupPop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MySignupPopup();
}

class _MySignupPopup extends State<SignupPop> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final mailController = TextEditingController();
  final profilePictureController = TextEditingController();
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
              hintText: 'username',
            ),
            controller: usernameController,
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 3.0)),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'password'),
            controller: passwordController,
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 3.0)),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'email'),
              controller: mailController),
          Padding(padding: const EdgeInsets.symmetric(vertical: 3.0)),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'profile picture'),
              controller: profilePictureController),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              /* vérifie que tous les champ du formulaire sont valide
                appel la fonction Signup et envoie en argument les inputs
              * */
              if (_formKey.currentState!.validate()) {
               String username = usernameController.text;
                Signup(username, passwordController.text, mailController.text,
                    profilePictureController.text);
                newInscription(username);
                //_insciptionEventCard(username,profilePictureController.text);
                Navigator.pop(context);
              }
            },
            child: Text('submit'),
          )
        ]));
  }
}


