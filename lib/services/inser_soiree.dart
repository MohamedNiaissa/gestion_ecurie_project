import 'package:gestion_ecurie/models/concours.dart';
import 'package:gestion_ecurie/models/user.dart';
import 'package:gestion_ecurie/services/mongodb.dart';
import '../backend/constant.dart';
import '../models/soiree.dart';

insertSoiree(nomSoiree, theme, photoSoiree, date) async {
  var db = await MongoDataBase.connect();
  var collection = await db.collection('Soirees');
  Soiree newSoiree = Soiree(nomSoiree, theme, photoSoiree, date,[]);
  collection.insertOne(newSoiree.toMap());
}

