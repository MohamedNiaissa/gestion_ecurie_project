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
  User newUser = User(
    user['username'],
    user['userPhoto'],
    user['userMail'],
    id: user['_id'],
    userPhone: user['userPhone'],
    profilFFE: user['profilFFE'],
    dateNaiss: user['dateNaiss'],
    isGerant: user['profilFFE'],
  );
  return newUser;
  } catch (e){
    throw Error();
  }

}
