import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import '../backend/constant.dart';


class MongoDataBase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);

    var collection = db.collection(COLLECTION_NAME);

    await collection.insertMany([{
      'username':'mp1',
      'name':'me me1',
      'email':'me.me1@me.com'
    },
      {
        'username': 'mp2',
        'name': 'me me2',
        'email': 'me.me2@me.com'
      }
    ]);
    print(await collection.find().toList());

  }
  }
