

import '../models/horse.dart';
import '../services/mongodb.dart';

NewHorse(horsename, coat, race, sexe, speciality, photo, birthday, username) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Chevaux');
  Horse newHorse = Horse(horsename, coat, race, sexe, speciality, photo, birthday, username);
  collection.insertOne(newHorse.toMap());
}