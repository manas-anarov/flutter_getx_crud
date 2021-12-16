import 'package:http/http.dart' as http;

const urlMain = 'https://jsonplaceholder.typicode.com/';

class HttpConnect {
  final String url;
  final dynamic body;

  HttpConnect({this.url, this.body});

  Future<http.Response> create() {
    return http.post(
      Uri.parse(urlMain + url),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(Duration(minutes: 2));
  }

  Future<http.Response> list() {
    return http.get(Uri.parse(urlMain + url)).timeout(Duration(minutes: 2));
  }

  Future<http.Response> detail() {
    return http.get(Uri.parse(urlMain + url)).timeout(Duration(minutes: 2));
  }

  Future<http.Response> edit() {
    return http.put(
      Uri.parse(urlMain + url),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(Duration(minutes: 2));
  }

  Future<http.Response> delete() {
    return http.delete(Uri.parse(urlMain + url)).timeout(Duration(minutes: 2));
  }
}
