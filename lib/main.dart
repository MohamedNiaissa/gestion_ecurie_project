import 'package:flutter/material.dart';
import 'package:gestion_ecurie/backend/local_storage.dart';
import 'package:gestion_ecurie/controller/login.dart';
import 'package:gestion_ecurie/view/pages/profil.dart';

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
  // déclaration des controllers pour le form de connexion
  TextEditingController username = new TextEditingController();
  TextEditingController mdp = new TextEditingController();

  int _counter = 0;

  void _incrementCounter() {
    LocalStorageHelper.clearAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person_add), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                // déclaration de la pop up
                title: Center(child: const Text('Connexion')),
                actions: <Widget>[
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom utilisateur',
                    ),
                  ),
                  SizedBox(height: 15), // Espace entre les deux champs
                  TextField(
                    controller: mdp,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mot de passe',
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => {
                        Navigator.pop(context, 'OK'),
                        verifyUser(username.text, mdp.text).then((_) => setState(() {})),
                      },
                      child: const Text('Se connecter'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            if(LocalStorageHelper.getValue("token") != null)...[
              IconButton(onPressed: () => {
                Navigator.of(context)
                    .pushNamed(Profil.tag)
                    .then((_) => setState(() {}))
              }, icon: Icon(Icons.person))
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
