import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import '../backend/constant.dart';

class MongoDataBase {
  // Connection à la db
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    return db;
  }
}
