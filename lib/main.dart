import 'package:flutter/material.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:gestion_ecurie/view/pages/profil.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
// Ici je créer la popup qui affichera le formulaire de création de compte
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          clipBehavior: Clip.none, children: <Widget>[
                          SignupPop()
                          ],
                        ),
                      );
                    });
              }),
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                // déclaration de la pop up
                title: Center(child: const Text('Connexion')),
                actions: <Widget>[
                  FormLogin()
                ],
              ),
            ),
          )
        ],
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
          if(LocalStorageHelper.getValue("tokenUser") != null)...[
              IconButton(onPressed: () => {
                Navigator.of(context)
                    .pushNamed(Profil.tag)
                    .then((_) => setState(() {}))
              }, icon: Icon(Icons.person))
            ]
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

