import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../controller/create_event.dart';

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

  DateTime date1 = DateTime(2022, 11, 18);

  String mychoosenDate = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: concours_form,
          child: Column(
            children: <Widget>[
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Specialite',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la specialite';
                  }
                  return null;
                },
                controller: adresse,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adresse',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                  controller: date, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        date.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  }),
              SizedBox(height: 15),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la date';
                  }
                  return null;
                },
                controller: photo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lien photo',
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () async => {
                    if (concours_form.currentState!.validate())
                      {
                        createAnEvent(nomConcours.text,specialite.text,adresse.text,DateTime.parse(date.text),photo.text)
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
