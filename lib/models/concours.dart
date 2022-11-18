class Concours {
  late String nomConcours;
  late String specialite;
  late String adresse;
  late String photo;
  late String date;
  late List participants = [];


  Concours(
      this.nomConcours, this.specialite, this.adresse, this.photo, this.date, this.participants);

  Map<String, dynamic> toMap() {
    return {
      'nomConcours': nomConcours,
      'specialite': specialite,
      'adresse': adresse,
      'photo': photo,
      'date': date,
      'participants' : participants
    };
  }
}