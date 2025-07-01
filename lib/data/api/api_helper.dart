import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api_header.dart';
import 'api_response.dart';

class ApiHelper {
  static const String _baseUrl = 'https://gutendex.com';

  static apiBooks({required int page}) async {
    var url = Uri.parse('$_baseUrl/books/?page=$page');

    var headerPost = apiHeader();

    var response = await http.get(url, headers: headerPost);
    var statusCode = response.statusCode;
    var reasonPhrase = response.reasonPhrase;

    var body = response.body;
    var decode = json.decode(body);

    if (apiResponse(statusCode)) {
      return decode;
    } else {
      throw '$reasonPhrase';
    }
  }

  static apiBooksDetail({required String id}) async {
    var url = Uri.parse('$_baseUrl/books/$id');

    var headerPost = apiHeader();

    var response = await http.get(url, headers: headerPost);
    var statusCode = response.statusCode;
    var reasonPhrase = response.reasonPhrase;

    var body = response.body;
    var decode = json.decode(body);

    if (apiResponse(statusCode)) {
      return decode;
    } else {
      throw '$reasonPhrase';
    }
  }
}
