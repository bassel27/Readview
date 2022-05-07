import 'package:http/http.dart' as http;

Future<String> fetchData({String url = "http://10.0.2.2:5000/?query=1"}) async {
  http.Response response = await http.get(Uri.parse(url));
  print(response.body.runtimeType);
  return response
      .body; // retruns JSON string that has to be decoded to be converted
}
