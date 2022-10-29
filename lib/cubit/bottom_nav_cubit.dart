import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit {
  int? index;
  BottomNavCubit(index) : super(0);

  void selectedIndex(int value) {
    emit(index == value);
  }
}
