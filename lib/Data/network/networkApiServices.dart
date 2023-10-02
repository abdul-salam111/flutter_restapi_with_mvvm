import 'dart:convert';
import 'dart:io';

import 'package:flutter_restapi_with_mavvm/Data/app_exceptions.dart';
import 'package:flutter_restapi_with_mavvm/Data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getResponse(String url) async {
    dynamic responsejson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No Internet Connection");
    }
    return responsejson;
  }

  @override
  Future getPostResponse(String url, dynamic data) async {
    dynamic responsejson;
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No Internet Connection");
    }

    return responsejson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonresponse = jsonDecode(response.body);
        return jsonresponse;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 404:
        throw UnAuthorizeExceptions();
      default:
        throw FetchDataExceptions(
            "Error occurred while communicating server with status code ${response.statusCode}");
    }
  }
}
