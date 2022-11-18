import 'package:mongo_dart/mongo_dart.dart';

class User {
   late String username;
   String? userMdp;
   late String userPhoto;
   late String userMail;
   String? userPhone;
   String? profilFFE;
   ObjectId? id;


   String? dateNaiss;
   late bool isGerant;

  User(
      this.username,
      this.userPhoto,
      this.userMail,
      {
        this.userMdp,
        this.id,
        this.userPhone,
        this.profilFFE,
        this.dateNaiss,
        this.isGerant = false,
      });



   @override
   String toString() {
       return 'User{"username": "'+username+'", "userPhoto": "'+userPhoto+'", "userMail": "'+userMail+'", "userPhone": $userPhone, "profilFFE": $profilFFE, "dateNaiss": $dateNaiss, "isGerant": $isGerant}';
   }
   Map<String, dynamic> toMap(){
     return {'username': username, 'userMdp': userMdp, 'userPhoto': userPhoto, 'userMail': userMail, 'userPhone': userPhone, 'profilFFE': profilFFE, 'dateNaiss': dateNaiss, 'isGerant': isGerant};
   }
}
