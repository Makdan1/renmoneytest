import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:renmoneytest/utils/http/response_handler.dart';

class HttpService {
  final String _baseUrl;

  HttpService(this._baseUrl);
  String get baseUrl => _baseUrl;

  Future<dynamic> get(String path) async {
    final String url = baseUrl + path;
    print('Request::URL: $url');
    final response =
        await http.get(Uri.parse(url),headers: await getHeaders(),).timeout(const Duration(seconds: 40));

    return handleResponse(response);
  }

  Future<dynamic> post(String path, Map<dynamic, dynamic> body) async {
    final String url = baseUrl + path;
    print('URL:: $url, body:: ${json.encode(body)}');

    final response = await http
        .post(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 30));

    return handleResponse(response);
  }

  Future<dynamic> patch(String path, Map<dynamic, dynamic> body) async {
    final String url = _baseUrl + path;
    print('URL:: $url, body:: ${json.encode(body)}');

    final response = await http
        .patch(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 30));

    return handleResponse(response);
  }

  Future<dynamic> put(String path, Map<dynamic, dynamic> body) async {
    final String url = _baseUrl + path;
    print('URL:: $url, body:: ${json.encode(body)}');

    final response = await http
        .put(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 30));

    return handleResponse(response);
  }

  Future<dynamic> delete(String path) async {
    final String url = _baseUrl + path;
    final response = await http
        .delete(
          Uri.parse(url),
          headers: await getHeaders(),
        )
        .timeout(const Duration(seconds: 30));

    return handleResponse(response);
  }

  getHeaders() async {
    return <String, String>{
      'Sourceappid': 'ckpu7zo0p0000gg5436coo7xs',
      "Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4OTkzOTQ5NjMzIiwiaWF0IjoxNjQ3ODY0MTAxLCJleHAiOjE2NDc5NTA1MDF9.hYEB2UoDytMRADWtQMRaGbNCghXjOVjAUVOHGiWySUBRXMM707RvP0sxzbAaY_meNkMY-VXJ5_AWJf7L9lOKHQ"
    };
  }
}
