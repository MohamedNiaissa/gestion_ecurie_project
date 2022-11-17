import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestion_ecurie/controller/actualites_controller.dart';
import 'package:gestion_ecurie/models/actualite.dart';
import 'package:gestion_ecurie/view/pages/signup_popup.dart';
import 'package:gestion_ecurie/backend/local_storage.dart';
import 'package:go_router/go_router.dart';

import '../shared/navbar.dart';
import 'FormLogin.dart';

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

  Card _inscriptionNewsCard(Actualite news) {
    return Card(
        child: Row(
          children: [
            Icon(Icons.newspaper),
            Text(news.eventType),
          ],
        )
    );
  }

  void _newEvent() {
    ActualitesController.insert();
    // ajoute une fausse inscription aux actualités
  }

  @override
  Widget build(BuildContext context) {
    //refreshNews();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Navbar(),
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