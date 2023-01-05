import 'package:equatable/equatable.dart';
import 'package:tixtix/models/concerts_model.dart';

class TransactionModel extends Equatable {
  final String id;
  final ConcertModel concert;
  final int amountOfConcert;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.concert,
    this.id = '',
    this.amountOfConcert = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        concert: ConcertModel.fromJson(json['concert']['id'], json['concert']),
        id: id,
        amountOfConcert: json['amountOfConcert'],
        selectedSeats: json['selectedSeats'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );

  @override
  List<Object?> get props => [
        concert,
        amountOfConcert,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
      ];
}
