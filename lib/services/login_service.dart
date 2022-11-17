import 'package:gestion_ecurie/models/user.dart';

import '../backend/constant.dart';
import 'mongodb.dart';

getUserFromCredential(String username, String mdp) async {
  var db = await MongoDataBase.connect();
  var user = await db.collection(COLLECTION_NAME).find({  //  Recherche de l'utilisteur dans la db en fonction de son username et mot de passe
    'username': username,
    'userMdp': mdp
  }).toList(); // Mettre ensuite le JSON de l'utilisateur dans un tableau

  try {
  User newUser = new User(user[0]["username"], user[0]["userMdp"], user[0]["userPhoto"], user[0]["userMail"], user[0]["userPhone"], user[0]["profilFFe"], user[0]["dateNaiss"], user[0]["isGerant"]);
  return newUser;
  } catch (e){
    throw Error();
  }

}
