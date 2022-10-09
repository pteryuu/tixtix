import 'package:flutter/cupertino.dart';

class TicketProvider extends ChangeNotifier {
  //Choice chip
  int _selectedIndex = 0;
  int get getSelectedIndex => this._selectedIndex;

  set setSelectedIndex(int value) {
    this._selectedIndex = value;
    notifyListeners();
  }
}
