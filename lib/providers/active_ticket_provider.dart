import 'package:flutter/cupertino.dart';
const List<String> activeTicketCategories = ['Dalam Negeri', 'Luar Negeri'];
class ActiveTicketProvider extends ChangeNotifier {
  //Choice chip

  String _selectedCategory = 'Dalam Negeri';
  String get getSelectedCategory => _selectedCategory;

  set setCategory(String value) {
    _selectedCategory = value;
    notifyListeners();
  }
}
