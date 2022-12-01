import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';

class ConcertModel extends Equatable {
  final String id;
  final String? name;
  final Timestamp? date;
  final String? desc;
  final String? location;
  final String? imageUrl;
  final int? price;

  ConcertModel(
      {required this.id,
      this.name,
      this.date,
      this.desc,
      this.location,
      this.imageUrl,
      this.price});

  factory ConcertModel.fromJson(String id, Map<String, dynamic> json) =>
      ConcertModel(
          id: id,
          name: json['name'],
          date: json['date'],
          desc: json['desc'],
          location: json['location'],
          imageUrl: json['imageUrl'],
          price: json['price']);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, date, desc, location, imageUrl, price];
}
