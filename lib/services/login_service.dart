import 'package:gestion_ecurie/models/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../backend/constant.dart';
import 'mongodb.dart';

getUserFromCredential(String username, String mdp) async {
  var db = await MongoDataBase.connect();
  var user = await db.collection(COLLECTION_NAME).find({  //  Recherche de l'utilisteur dans la db en fonction de son username et mot de passe
    'username': username,
    'userMdp': mdp
  }).toList(); // Mettre ensuite le JSON de l'utilisateur dans un tableau

  try {
  User newUser = User(
    user[0]['username'],
    user[0]['userPhoto'],
    user[0]['userMail'],
    id: user[0]['_id'],
    userPhone: user[0]['userPhone'],
    profilFFE: user[0]['profilFFE'],
    dateNaiss: user[0]['dateNaiss'],
    isGerant: user[0]['isGerant'],
  );
  return newUser;
  } catch (e){
    throw Error();
  }

}

resetPassword(String username,String mail, String mdp) async {
  var db = await MongoDataBase.connect();
  var user = await db.collection("Users").findOne({
    'username': username,
    'userMail' : mail
  });

  user.updateOne(modify.set("userMdp", mdp));
}
