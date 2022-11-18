import 'package:mongo_dart/mongo_dart.dart';

class Horse {
  late String horsename;
  late String horsecoat;
  late String horserace;
  late String horsesexe;
  late String horsespeciality;
  late String horsePP;
  late DateTime horsebirth;
  late ObjectId? horseowner;

  Horse(this.horsename,this.horsecoat, this.horserace, this.horsesexe, this.horsespeciality,
      this.horsePP, this.horsebirth, this.horseowner);

  Map<String, dynamic> toMap() {
    return {
      'horsename': horsename,
      'horsecoat': horsecoat,
      'horserace': horserace,
      'horserace': horsesexe,
      'horsespeciality': horsespeciality,
      'horsePP': horsePP,
      'horsebirth': horsebirth,
      '_horseowner': horseowner
    };
  }
}
