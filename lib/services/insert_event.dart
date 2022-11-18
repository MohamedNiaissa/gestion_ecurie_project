import 'package:gestion_ecurie/models/actualite.dart';
import 'package:gestion_ecurie/models/concours.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

insertEvent(nomconcours, specialite, adresse, DateTime date, photo, username ) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Concours');
  Concours newConcours = Concours(nomconcours, specialite, adresse,photo,date,[]);
  collection.insertOne(newConcours.toMap());


  await  db.collection('Users').findOne(where.eq("username", username).fields(['str_field','my_field']));
  var user = await db.collection('Users').findOne({"username": username});
  var id_user = user["_id"];

  Actualite actu = new Actualite("concours", id_user, date, DateTime.now());
  await db.collection('Actualites').insertOne(actu.toMap());
}