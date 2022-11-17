import 'package:gestion_ecurie/models/actualite.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ActualitesController {
  static insert() async {
    var db = await MongoDataBase.connect();
    DbCollection newsCollection = await db.collection('Actualites');
    DbCollection usersCollection = db.collection('Users');
    var author = await usersCollection.find().first;
    Actualite news = Actualite("Inscription", author['_id'], DateTime.now(), DateTime.now());
    newsCollection.insertOne(news.toMap());
  }
}
