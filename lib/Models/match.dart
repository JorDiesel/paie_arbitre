
class MatchModel{
  final int id;
  final String date;
  final String ville;
  final int numeromatch;
  final String categorie;
  final String heure;
  final String poste;
  final int tarif;

  const MatchModel({
    required this.id,
    required this.date,
    required this.ville,
    required this.numeromatch,
    required this.categorie,
    required this.heure,
    required this.poste,
    required this.tarif
  });
}