import 'package:gestion_ecurie/models/user.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import '../backend/constant.dart';

Signup(username, password, mail, profilePicture) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Users');
  User newUser = User(username, password, mail, profilePicture, null, null, null, false);
  collection.insertOne(newUser.toMap());
}