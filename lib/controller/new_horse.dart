

import 'package:gestion_ecurie/models/actualite.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../models/horse.dart';
import '../services/mongodb.dart';


class NewHorse {
  //ajoute un cheval à la BDD
  static void AddHorse(
      horsename,
      coat,
      race,
      sexe,
      speciality,
      photo,
      birthday,
      username
      ) async {
    var db = await MongoDataBase.connect();
    var collection = await db.collection('Chevaux');
    var users = db.collection('Users');
    var actus = db.collection('Actualites');
    var owner = await users.findOne({'username': username});
    Actualite actu = Actualite("Cheval", owner['_id'], DateTime.now(), DateTime.now());
    Horse newHorse = Horse(
        horsename,
        coat,
        race,
        sexe,
        speciality,
        photo,
        DateTime.now(),
        owner['_id']
    );
    collection.insertOne(newHorse.toMap());
    actus.insertOne(actu.toMap());
  }

  static Stream<Horse> fetchNews() async* {
    //Cherche les Chevaux dans la BDD et les renvoie sous forme d'objets

    var db = await MongoDataBase.connect();
    DbCollection newsCollection = await db.collection('Chevaux');
    var dbNews = newsCollection.find();

    await for (final news in dbNews) {
      Horse newHead = Horse(
          news['horsename'],
          news['horsecoat'],
          news['horserace'],
          news['horsesexe'],
          news['horsespeciality'],
          news['horsePP'],
          news['horsebirth'],
          news['horseowner']);
      print(newHead);
      yield newHead;
    }
  }
}