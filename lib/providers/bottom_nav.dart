import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int _indexScreen = 0;

  int get indexScreen => _indexScreen;
  set indexScreen(int index) {
    _indexScreen = index;
    notifyListeners();
  }

  int _halaman = 0;

  int get halaman => _halaman;
  set halaman(int index) {
    _halaman = index;
    _indexScreen = index;

    notifyListeners();
  }
}
