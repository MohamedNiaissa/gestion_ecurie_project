import 'package:gestion_ecurie/models/concours.dart';
import 'package:gestion_ecurie/services/mongodb.dart';

insertEvent(nomconcours, specialite, adresse, DateTime date, photo ) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Concours');
  Concours newConcours = Concours(nomconcours, specialite, adresse,photo,date,[]);
  collection.insertOne(newConcours.toMap());
}