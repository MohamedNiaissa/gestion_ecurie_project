class User {
   late String username;
   late String userMdp;
   late String userPhoto;
   late String userMail;
   String? userPhone;
   String? profilFFE;


   String? dateNaiss;
   late bool isGerant;

  User(this.username, this.userMdp, this.userPhoto, this.userMail, this.userPhone,
      this.profilFFE, this.dateNaiss, this.isGerant);



   @override
   String toString() {
      return 'User{username: $username, userMdp: $userMdp, userPhoto: $userPhoto, userMail: $userMail, userPhone: $userPhone, profilFFE: $profilFFE, dateNaiss: $dateNaiss, isGerant: $isGerant}';
   }
}
