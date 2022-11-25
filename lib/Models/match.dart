
class MatchModel{
  final int id;
  final int numeroMatch;
  final String categorie;
  final String classification;
  final String typeArbitre;
  final String ville;
  final String date;
  final String heure;

  const MatchModel({
    required this.id,
    required this.numeroMatch,
    required this.categorie,
    required this.classification,
    required this.typeArbitre,
    required this.ville,
    required this.date,
    required this.heure
  });
}