
import 'dart:ffi';

class PaieModel{
  final int id;
  final String date;
  final Float montant;

  const PaieModel({
    required this.id,
    required this.date,
    required this.montant
  });
}