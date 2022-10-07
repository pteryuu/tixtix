import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc {
  int _counter = 0;

  //Membuat suatu controller (selang) untuk event/inputan
  StreamController _inputController = StreamController();
  //Membuat sink
  StreamSink get sinkInput => _inputController.sink;

  //Data yang sudah berubah kita kirimkan ke controller output
  StreamController _outputController = StreamController();
  StreamSink get _sinkOutput => _outputController.sink;

  Stream get output => _outputController.stream;

  //Membuat mesinnya, bisa dijalankan dgn constructor
  CounterBloc() {
    //Event adalah data dari hasil inputan
    _inputController.stream.listen((event) {
      if (event == 'add') {
        _counter++;
      } else {
        _counter--;
      }

      //Tambahkan data yang kita kirimkan ke controller
      _sinkOutput.add(_counter);
    });
  }

  //Data yang sudah berubah kita kirimkan ke controller output (diatas)

  //Harus ditutup, karena akan terus mengalir
  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}

class CubitCounter extends Cubit<int> {
  CubitCounter({this.init = 0}) : super(init);

  int init;

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
