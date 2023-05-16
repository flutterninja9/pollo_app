import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<http.Response> get(Uri uri, {Map<String, String>? header}) async {
    header ??= await _getHeaders();
    final responce = await http.get(uri, headers: header);
    return responce;
  }

  Future<http.Response> post(Uri uri,
      {Map<String, String>? header, String? body}) async {
    header ??= await _getHeaders();
    final response = await http.post(uri, headers: header, body: body);
    return response;
  }

  Future<http.Response> put(Uri uri,
      {Map<String, String>? header, String? body}) async {
    header ??= await _getHeaders();
    final response = await http.put(uri, headers: header, body: body);
    return response;
  }

  Future<http.Response> delete(Uri uri, {Map<String, String>? header}) async {
    header ??= await _getHeaders();
    final response = await http.delete(uri, headers: header);
    return response;
  }

  Future<Map<String, String>?> _getHeaders() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString('authToken');
    if (accessToken != null) {
      return {
        'Content-type': 'application/json',
      };
    }
    return null;
  }
}
