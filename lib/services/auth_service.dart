import 'package:firebase_auth/firebase_auth.dart';
import 'package:tixtix/services/user_servide.dart';

import '../models/user_model.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp(
      {required String name,
      required String email,
      required String password,
      required String birth}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
          id: userCredential.user!.uid,
          name: name,
          email: email,
          password: password,
          birth: birth);
      await UserService().setUser(user);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
