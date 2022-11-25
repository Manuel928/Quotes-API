import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() async {
  var data = await getQuotes();
  for (var i = 0; i <= 50; i++) {
    await Future.delayed(Duration(hours: 12), () {
      print("${data[i]['text']}");
      print('     ~ ${data[i]['author']}');
      print('----------------------------------');
    });
  }
}

Future<dynamic> getQuotes() async {
  final url = 'https://type.fit/api/quotes';
  var res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    var obj = json.decode(res.body);
    return obj;
  } else {
    print('Error');
  }
}
