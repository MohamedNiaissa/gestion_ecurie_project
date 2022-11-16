import 'package:mongo_dart/mongo_dart.dart';

import '';
import '../backend/constant.dart';
import 'mongodb.dart';

getUser(String username, String mdp) async {
  var db = await MongoDataBase.connect();
  var user = await db.collection(COLLECTION_NAME).find({
    'username': username,
    'userMdp': mdp
  }).toList();

  print("**************");
  print(user);
  print("**************");
}
