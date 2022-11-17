class User {
   String username;
   String userMdp;
   String userPhoto;
   String? userMail = null;
   String? userPhone = null;
   String? profilFFE = null;
   String? dateNaiss = null;
   bool isGerant;

  User(this.username, this.userMdp, this.userPhoto, this.userMail, this.userPhone,
      this.profilFFE, this.dateNaiss, this.isGerant);
}
