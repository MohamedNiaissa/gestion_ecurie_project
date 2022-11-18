import 'package:gestion_ecurie/models/actualite.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

  newInscription(username) async {
    //ajoute un évènement correspondant à l'inscription de l'utilisateur passé en argument
    var db = await MongoDataBase.connect();
    DbCollection newsCollection = db.collection('Actualites');
    DbCollection usersCollection = db.collection('Users');
    
    var allUsers = usersCollection.find();
    ObjectId author = ObjectId();
    await for (var user in allUsers){
      if(user['username'] == username){
        author = user['_id'];
      }
    }
    // récupère l'id de l'user dont l'username est en argument
    Actualite news = Actualite('inscription', author, DateTime.now(), DateTime.now(),status: 'ok', ObjectId());
    newsCollection.insertOne(news.toMap());
  }
