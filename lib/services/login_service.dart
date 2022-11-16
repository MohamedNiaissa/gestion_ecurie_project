import 'package:mongo_dart/mongo_dart.dart';

import '';
import '../backend/constant.dart';
import 'mongodb.dart';

getUser(String username, String mdp) async {
  var db = await MongoDataBase.connect();
  var user = await db.collection(COLLECTION_NAME).find({  //  Recherche de l'utilisteur dans la db en fonction de son username et mot de passe
    'username': username,
    'userMdp': mdp
  }).toList(); // Mettre ensuite le JSON de l'utilisateur dans un tableau

  print(user);
}
