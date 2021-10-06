import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Response {
  final String id;
  final String object;
  final int created;
  final String model;
  final List choices;
  Response(this.id, this.object, this.created, this.model, this.choices);
}

Future<Response> sendOAIRequest(var url, String prompt) async {
  var headers = {
    HttpHeaders.authorizationHeader: 'Bearer API-KEY-HERE',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  var body = jsonEncode(
    {
      'prompt': prompt,
      'max_tokens': 64,
      'temperature': 0.6,
      'presence_penalty': 0.2,
      'frequency_penalty': 0.25,
    },
  );
  var jsonResponse = await http.post(
    url,
    headers: headers,
    body: body,
  );
  var _response = jsonDecode(jsonResponse.body);
  return Response(
    _response['id'],
    _response['object'],
    _response['created'],
    _response['model'],
    _response['choices'],
  );
}
