import 'package:mongo_dart/mongo_dart.dart';

class Actualite{

  late String eventType;
  late DateTime creationDate;
  late DateTime endDate;
  late String status;
  late ObjectId author;

  Actualite(this.eventType, this.author, this.endDate, this.creationDate, {this.status = "pending"});

  Map<String, dynamic> toMap() {
    return {
      'eventType': eventType,
      'creationDate': creationDate,
      '_author': author,
      'endDate': endDate,
      'status': status,
    };
  }
}