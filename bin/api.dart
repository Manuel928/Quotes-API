import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  var data = await fetchUsers();
  for (var element in data) {
    print('id: ${element['id']}\n');
    print('Name: ${element['name']}\n');
    print('Preffered Username: ${element['username']}\n');
    print('Email: ${element['email']}\n');
    print('Address Info (zipcode): ${element['address']['zipcode']}\n');
    print('----------------------');
  }
}

Future<dynamic> fetchUsers() async {
  try {
    final url = 'https://jsonplaceholder.typicode.com/users';
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj;
    } else {
      print('Error');
    }
  } catch (e) {
    print('Error: $e');
  }
}
