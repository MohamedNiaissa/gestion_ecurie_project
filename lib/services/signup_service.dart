import 'package:gestion_ecurie/services/mongodb.dart';
import '../backend/constant.dart';

Signup(username, password, mail, profilePicture) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Users');
  collection.insertOne({
    'username': username,
    'userMdp': password,
    'userMail': mail,
    'userPhoto': profilePicture,
    'userPhone' :null,
    'profilFFE' :null,
    'dateNaiss' :null,
    'isGerant' : false
  });
}
