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

    Actualite news = Actualite("Inscription", author['_id'], DateTime.now(), DateTime.now(),ObjectId());
    newsCollection.insertOne(news.toMap());
  }

  static Stream<Actualite> fetchNews() async*{
    //Cherche les Actus dans la BDD et les renvoie sous forme d'objets
    
    var db = await MongoDataBase.connect();
    DbCollection newsCollection = await db.collection('Actualites');
    var dbNews = newsCollection.find();

    await for (final news in dbNews){
      Actualite actu = Actualite(news['eventType'], news['_author'], news['endDate'], news['creationDate'],ObjectId());
      yield actu;
    }
  }
}
