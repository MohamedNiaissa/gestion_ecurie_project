import 'package:gestion_ecurie/models/actualite.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ActualitesController {
  static void insert() async {
    //ajoute un évènement correspondant (pour l'instant) à l'inscription du premier utilisateur trouvé
    var db = await MongoDataBase.connect();
    DbCollection newsCollection = db.collection('Actualites');
    DbCollection usersCollection = db.collection('Users');

    var author = await usersCollection.find().first;
    // récupère un user, penser à mettre un where en argument du find pour tout usage spécifique

    Actualite news = Actualite("Inscription", author['_id'], DateTime.now(), DateTime.now());
    newsCollection.insertOne(news.toMap());
  }

  static Future<List<Actualite>> fetchNews() async {
    List<Actualite> newsList = [];
    var db = await MongoDataBase.connect();
    DbCollection newsCollection = await db.collection('Actualites');
    var dbNews = await newsCollection.find();
    dbNews.forEach((news) {
      Actualite actualite = Actualite(news['eventType'], news['_author'], news['endDate'], news['creationDate']);
      print(actualite);
      newsList.add(actualite);
    });
    return newsList;
  }
}
