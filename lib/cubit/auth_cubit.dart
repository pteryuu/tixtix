import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tixtix/services/auth_service.dart';
import 'package:tixtix/services/user_service.dart';

import '../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    try {
      emit(AuthLoad());
      UserModel user =
          await AuthService().login(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp(
      {required String name,
      required String email,
      required String password,
      required String birth}) async {
    try {
      emit(AuthLoad());
      UserModel user = await AuthService()
          .signUp(name: name, email: email, password: password, birth: birth);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoad());
      await AuthService();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
