import 'package:flutter/material.dart';
import 'package:gestion_ecurie/controller/create_soiree.dart';
import 'package:intl/intl.dart';

class FormSoiree extends StatefulWidget {
  const FormSoiree({Key? key}) : super(key: key);

  @override
  State<FormSoiree> createState() => _FormSoireeState();
}

class _FormSoireeState extends State<FormSoiree> {
  final soiree_form = GlobalKey<FormState>();
  TextEditingController nomSoiree = new TextEditingController();
  TextEditingController theme = new TextEditingController();
  TextEditingController photoSoiree = new TextEditingController();
  TextEditingController date = new TextEditingController();

 String  mychoosenDate = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: soiree_form,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer le nom de la soirée";
                  }
                  return null;
                },
                controller: nomSoiree,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom de la soirée',
                ),
              ),
              SizedBox(height: 15), // Espace entre les deux champs
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la soirée';
                  }
                  return null;
                },
                controller: theme,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Thème',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le lien de la photo';
                  }
                  return null;
                },
                controller: photoSoiree,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lien photo',
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
                        mychoosenDate = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  }),
              Center(
                child: TextButton(
                  onPressed: () async => {
                    if (soiree_form.currentState!.validate())
                      {
                        createAsoiree(nomSoiree.text,theme.text,photoSoiree.text,mychoosenDate)
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
