import 'package:flutter/material.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:gestion_ecurie/view/pages/profil.dart';
import 'package:gestion_ecurie/view/pages/signup_popup.dart';
import 'package:gestion_ecurie/backend/local_storage.dart';
import 'package:gestion_ecurie/view/pages/FormLogin.dart';
import 'package:gestion_ecurie/view/shared/navbar.dart';

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
      routes:
      {Profil.tag: (context) => const Profil(),
      },
      home: const MyHomePage(title: 'PegasusClub'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void clearLocalStorage() {
    setState(() {
      LocalStorageHelper.clearAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Navbar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // créer le menu burger
      drawer: Drawer(
          child: ListView(children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text("Les chevaux de l'écurie"),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text('Les événements prévues'),
              onTap: () {
              },
            )
          ])),

      floatingActionButton: FloatingActionButton(
        onPressed: clearLocalStorage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

    );
  }
}

