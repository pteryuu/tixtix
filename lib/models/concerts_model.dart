import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';

class ConcertModel extends Equatable {
  final String id;
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
          // name: json['name'],
          // date: json['date'],
          // desc: json['description'],
          // location: json['location'],
          // imageUrl: json['imageUrl'],
          name: (json['name'] ?? '').toString(),
          date: (json['date'] ?? '').toString(),
          desc: (json['description'] ?? '').toString(),
          location: (json['location'] ?? '').toString(),
          imageUrl: (json['imageUrl'] ?? '').toString(),
          // price: json['price']

          price: (json['price'] ?? 0));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date,
        'desc': desc,
        'location': location,
        'imageUrl': imageUrl,
        'price': price,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, date, desc, location, imageUrl, price];
}

class TypesHelper {
  static int toInt(num val) {
    try {
      if (val == null) {
        return 0;
      }
      if (val is int) {
        return val;
      } else {
        return val.toInt();
      }
    } catch (error) {
      print('Error');
      return 0;
    }
  }
}
