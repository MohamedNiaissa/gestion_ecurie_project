import 'package:gestion_ecurie/models/concours.dart';
import 'package:gestion_ecurie/models/user.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import '../backend/constant.dart';

insertEvent(nomconcours, specialite, adresse, date, photo ) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Concours');
  Concours newConcours = Concours(nomconcours, specialite, adresse, date,photo,[]);
  collection.insertOne(newConcours.toMap());
}