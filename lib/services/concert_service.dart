import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tixtix/models/concerts_model.dart';

class ConcertService {
  CollectionReference _concertRef =
      FirebaseFirestore.instance.collection('concerts');

  Future<List<ConcertModel>> fetchConcerts() async {
    try {
      QuerySnapshot result = await _concertRef.get();
      List<ConcertModel> concerts = result.docs.map((e) {
        return ConcertModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return concerts;
    } catch (e) {
      throw e;
    }
  }
}
