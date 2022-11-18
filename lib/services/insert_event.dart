import 'package:gestion_ecurie/models/concours.dart';
import 'package:gestion_ecurie/models/user.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import '../backend/constant.dart';

insertEvent(nomconcours, specialite, adresse, photo, date ) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Concours');
  Concours newConcours = Concours(nomconcours, specialite, adresse, photo,date,[]);
  collection.insertOne(newConcours.toMap());
}