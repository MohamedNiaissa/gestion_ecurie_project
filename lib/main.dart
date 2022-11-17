import 'package:flutter/material.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:gestion_ecurie/view/pages/home_page.dart';
import 'package:gestion_ecurie/view/pages/signup_popup.dart';
import 'package:gestion_ecurie/backend/local_storage.dart';
import 'package:gestion_ecurie/controller/login.dart';
import 'package:gestion_ecurie/view/pages/FormLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
        appBarTheme: const AppBarTheme(
          //color: Colors.orange,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
        // renvoie au fichier route.dart qui affichera la route dont le chemin est '/'
        routerConfig: router,
      //home: const HomePage(title: 'PegasusClub'),
    );
  }
}

