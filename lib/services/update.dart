import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

updateUser(field, username, fieldtomodify, value) async {
    var db = await MongoDataBase.connect();
    var collection = await db.collection('Users');
    collection.updateOne(where.eq(field, username), modify.set(fieldtomodify, value));
  }

  UpdateName() async {
    var db = await MongoDataBase.connect();
    var collection = await db.collection('Users');
    collection.updateOne(where.eq("username", "value"), modify.set("username", "Jean"));
}
