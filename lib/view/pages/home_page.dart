import 'package:flutter/material.dart';
import 'package:gestion_ecurie/controller/actualites_controller.dart';
import 'package:gestion_ecurie/models/actualite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Actualite> news = [];
  
  clearLocalStorage() {
    setState(() {
      LocalStorageHelper.clearAll();
    });
  }

  void refreshNews() async{
    var dbNews = await ActualitesController.fetchNews();
    setState(() {
      news = dbNews;
    });
  }

  Card _inscriptionNewsCard(Actualite news){
    return Card(
      child: Row(
        children: [
          Icon(Icons.newspaper),
          Text(news.eventType),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    //refreshNews();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed :() => context.go('/')),

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
                  return _inscriptionNewsCard(news[index]);
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshNews,
        tooltip: 'refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
