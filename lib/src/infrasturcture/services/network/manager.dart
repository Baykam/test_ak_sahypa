import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  NetworkManager._();
  static NetworkManager get i => NetworkManager._();

  String get getApi => 'http://192.168.10.184:2000/parse/classes/';

  dynamic decode(Uint8List data) {
    return json.decode(utf8.decode(data));
  }

  Map<String, String> get headers{
    final header = {
      'X-Parse-Application-Id': 'testid',
      'X-Parse-REST-API-Key': '123456',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    return header;
  }

  Future<http.Response> get({
    required String url,
    Map<String, String>? header,
  }) async {
    final res = await http.get(
      Uri.parse('$getApi$url'),
      headers: header ?? headers,
    );
    return res;
  }
}