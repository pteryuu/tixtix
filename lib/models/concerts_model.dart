import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';

class ConcertModel extends Equatable {
  final String? id;
  final String name;
  final String date;
  final String desc;
  final String location;
  final String imageUrl;
  final int price;

  ConcertModel(
      {required this.id,
      this.name = '',
      this.date = '',
      this.desc = '',
      this.location = '',
      this.imageUrl = '',
      this.price = 0});

  factory ConcertModel.fromJson(String id, Map<String, dynamic> json) =>
      ConcertModel(
          id: id,
          name: (json['name'] ?? '').toString(),
          date: (json['date'] ?? '').toString(),
          desc: (json['description'] ?? '').toString(),
          location: (json['location'] ?? '').toString(),
          imageUrl: (json['imageUrl'] ?? '').toString(),
          price: (json['price'] ?? 0));

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, date, desc, location, imageUrl, price];

  toJson() {}
}
