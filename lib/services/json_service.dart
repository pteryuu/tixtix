import 'dart:convert';
import 'package:http/http.dart' as http;

class JsonService {
  Future fetchItem() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/lib/consts/movies_data.dson'));
    if (response.statusCode == 200) {
      print(json.decode(response.body));
    } else {
      print('Fetch item failed');
    }
  }
}
