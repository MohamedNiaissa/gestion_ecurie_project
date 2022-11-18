
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_ecurie/backend/local_storage.dart';
import 'package:gestion_ecurie/controller/actualites_controller.dart';
import 'package:gestion_ecurie/controller/users_controller.dart';
import 'package:gestion_ecurie/models/actualite.dart';
import 'package:gestion_ecurie/models/user.dart';
import 'package:gestion_ecurie/view/pages/signup_popup.dart';
import 'package:go_router/go_router.dart';

import 'FormLogin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Actualite> news = [];
  Map<String,User> authors = {};
  //De la forme {ObjectId.toString(): User}

  void refreshNews() async{
    //met à jour les actualités
    news = [];
    authors = {};
    Stream<Actualite> newsStream = ActualitesController.fetchNews();
    saveNews(newsStream);
  }

  void saveNews(Stream<Actualite> actus) async {
    //Ajoute à news et authors les Actualite du stram en argument et leurs auteurs
    await for (final actu in actus){
      User author = await UsersController.getUser(actu.author);
      setState(() {
        news.add(actu);
        authors[actu.author.toString()] = author;
      });
    }
  }

  Card getNewsCard(Actualite news){
    print(authors[news.author.toString()]?.username);
    var loggedIn;
    if (LocalStorageHelper.getValue("tokenUser") != null) {
      loggedIn =
          jsonDecode(LocalStorageHelper.getValue("tokenUser").substring(4));
    }

    print(news.status);
      if (news.status == "ok" ||
          loggedIn?['username'] == authors[news.author.toString()]?.username ||
          loggedIn?['isGerant'] == true
      )
      {
        return _inscriptionNewsCard(news);
      };
      User? author = authors[news.author.toString()];
      String? authorName = author?.username;
      return Card(
        child: ListTile(
          leading: Icon(Icons.newspaper),
          title: Text("Proposition de $authorName"),
        ),
      );
    }


  Card _inscriptionNewsCard(Actualite news) {
    User? author = authors[news.author.toString()];
    String? authorName = author?.username;
    return Card(
        child: ListTile(
          leading: Icon(Icons.newspaper),
          title: Text("${news.eventType} de $authorName"),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Image.asset('assets/img/unicorn_logo.png'),
              onPressed :() => context.go('/')),

          IconButton(
              icon: const Icon(Icons.person_add),
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
            icon: const Icon(Icons.login),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => const AlertDialog(
                // déclaration de la pop up
                title: Center(child: Text('Connexion')),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Actualités du club',
              style: Theme.of(context).textTheme.headline4,
            ),
            ListView.builder(
              itemCount: news.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return getNewsCard(news[index]);
                }
            ),
          ],
        ),
      ),
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
                return context.go('/horse_page');
              },
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshNews,
        tooltip: 'refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
