import 'package:flutter/material.dart';
import 'package:gestion_ecurie/route/route.dart';
import 'package:gestion_ecurie/view/pages/event_stable.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
        // renvoie au fichier route.dart qui affichera la route dont le chemin est '/'
        routerConfig: router,
      //home: const HomePage(title: 'PegasusClub'),
    );
  }
}
