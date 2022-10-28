import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tixtix/models/user_model.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('user');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'password': user.password,
        'birth': user.birth
      });
    } catch (e) {
      throw e;
    }
  }
}
