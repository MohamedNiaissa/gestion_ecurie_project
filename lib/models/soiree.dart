class Soiree {
  late String nomSoiree;
  late String theme;
  late String photoSoiree;
  late String date;
  late List participants = [];


  Soiree(this.nomSoiree, this.theme, this.photoSoiree,  this.date,
      this.participants);

  Map<String, dynamic> toMap() {
    return {
      'nomSoiree': nomSoiree,
      'theme': theme,
      'photoSoiree': photoSoiree,
      'date': date,
      'participants' : participants
    };
  }
}