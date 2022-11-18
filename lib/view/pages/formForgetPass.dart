import 'package:flutter/material.dart';

import '../../services/login_service.dart';

class FormForgetPass extends StatefulWidget {
  const FormForgetPass({Key? key}) : super(key: key);

  @override
  State<FormForgetPass> createState() => _FormForgetPassState();
}

class _FormForgetPassState extends State<FormForgetPass> {
  TextEditingController user = new TextEditingController();
  TextEditingController newPass = new TextEditingController();
  TextEditingController mail = new TextEditingController();
  final forget_form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: forget_form,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer le nom ";
                  }
                  return null;
                },
                controller: user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom',
                ),
              ),
              SizedBox(height: 15), // Espace entre les deux champs
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le mail';
                  }
                  return null;
                },
                controller: mail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mail',
                ),
              ),

              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nouveau mot de passe';
                  }
                  return null;
                },
                controller: newPass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'new password',
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: TextButton(
                  onPressed: () async => {
                    if (forget_form.currentState!.validate())
                      {
                        resetPassword(user.text, mail.text,newPass.text )
                      },
                  },
                  child: const Text('Créer'),
                ),
              ),
            ],
          ),
        ));
  }
}
