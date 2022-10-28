import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tixtix/services/auth_service.dart';

import '../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

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
}
