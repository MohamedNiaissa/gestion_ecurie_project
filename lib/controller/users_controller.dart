import 'package:gestion_ecurie/models/user.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UsersController {

  static Future<User> getUser(id) async {
    //Renvoie un objet User correspondant à l'utilisateur dont l'id est en argument
    //Crée une erreur en cas d'absence de correspondance
    //A noter que l'objet renvoyé ne contient pas de mot de passe 
    var db = await MongoDataBase.connect();
    DbCollection usersCollection = await db.collection('Users');

    var user = await usersCollection.findOne({'_id': id});

    if (user != null){
      User newUser = User(
        user['username'],
        user['userPhoto'],
        user['userMail'],
        id: user['_id'],
        userPhone: user['userPhone'],
        profilFFE: user['profilFFE'],
        dateNaiss: user['dateNaiss'],
        isGerant: user['isGerant'],
      );
      return newUser;
    } else {
      throw Error();
    }
  }
}
