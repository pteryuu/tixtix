import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final String birth;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.birth});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, password, birth];
}
