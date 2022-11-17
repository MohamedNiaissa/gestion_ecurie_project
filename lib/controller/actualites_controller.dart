import 'package:gestion_ecurie/models/actualite.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ActualitesController {
  static insert() async {
    //ajoute un évènement correspondant (pour l'instant) à l'inscription du premier utilisateur trouvé
    var db = await MongoDataBase.connect();
    DbCollection newsCollection = await db.collection('Actualites');
    DbCollection usersCollection = db.collection('Users');

    var author = await usersCollection.find().first;
    // récupère un user, penser à mettre un where en argument du find pour tout usage spécifique

    Actualite news = Actualite("Inscription", author['_id'], DateTime.now(), DateTime.now());
    newsCollection.insertOne(news.toMap());
  }
}
