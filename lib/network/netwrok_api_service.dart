import 'dart:io';

import 'package:pokemon_riverpod/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getResponse(String url) async {
    dynamic responseJson;
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('No service found');
    } on FormatException {
      throw Exception('Invalid response');
    } catch (e) {
      throw Exception('Something went wrong');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 400) {
    } else if (response.statusCode == 401) {
    } else if (response.statusCode == 403) {
    } else if (response.statusCode == 500) {
    } else {
      return {
        'status_code': response.statusCode,
        'message': 'Something went wrong'
      };
    }
  }
}
