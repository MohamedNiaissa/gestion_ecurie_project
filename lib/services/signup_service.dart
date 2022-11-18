import 'package:gestion_ecurie/models/user.dart';
import 'package:gestion_ecurie/services/mongodb.dart';

Signup(username, password, mail, profilePicture) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Users');
  User newUser = User(username, profilePicture, mail, userMdp: password);
  collection.insertOne(newUser.toMap());
}