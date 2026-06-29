import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:amk_mobile/services/api_key.dart';
import 'package:amk_mobile/services/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      // Simulate network delay
      final response = await http
          .get(
            Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              "api-key": ApiKey.key,
            },
          )
          .timeout(const Duration(seconds: 10));
      responseJson = apiResponse(response);
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find the data");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Request timed out");
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              "api-key": ApiKey.key,
            },
            body: data,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = apiResponse(response);
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find the data");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Request timed out");
    }
    return responseJson;
  }

  dynamic apiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw Exception("Bad Request: ${response.body}");
      case 401:
      case 403:
        throw Exception("Unauthorized: ${response.body}");
      case 500:
        throw Exception("Internal Server Error: ${response.body}");
      default:
        throw Exception(
          "Error occurred with StatusCode: ${response.statusCode}",
        );
    }
  }
}
