import 'package:http/http.dart'
    as http; // to clarify that get method is used from http package because it look like it's a user-defined function

    
Future<String> fetchData({String url = "http://10.0.2.2:5000/?query=1"}) async {
  http.Response response = await http.get(Uri.parse(url));
  return response
      .body; // retruns JSON string that has to be decoded to be converted
}
