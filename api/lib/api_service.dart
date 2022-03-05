library api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:uuid/uuid.dart';

part 'response/failure.dart';
part 'utils/debuggable_client.dart';
part 'endpoints.dart';

/// A Calculator.
class API {
  final Uri _baseUrl;
  final http.Client _client;

  @visibleForTesting
  API(this._baseUrl, this._client);

  factory API.create(
      {required String baseUrl,
      Duration connectionTimeout = const Duration(seconds: 5)}) {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = connectionTimeout;
    return API(
        Uri.parse(baseUrl), IOClient(httpClient));
  }

  factory API.debuggable(
      {required String baseUrl,
      Duration connectionTimeout = const Duration(seconds: 5)}) {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = connectionTimeout;
    return API(Uri.parse(baseUrl),
        _DebuggableClient(IOClient(httpClient)));
  }

  factory API.proxy(
      {required String baseUrl,
      required String proxyIp,
      Duration connectionTimeout = const Duration(seconds: 5)}) {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = connectionTimeout;

    httpClient.findProxy = (uri) {
      return "PROXY $proxyIp:8888;";
    };

    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => Platform.isAndroid);
    return API(
        Uri.parse(baseUrl), IOClient(httpClient));
  }

  void getDataSearch(Function(String) onResponse, String value) async {
    final url = _endpoint(productByLocation);
    final Map<String, String> headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };

    final Map<String, String> body = <String, String>{
      'location_id': "429",
      'keyword': value,
    };
    _handleRequest<void>(
        onRequest: () => _client.post(url, headers: headers, body: body),
        onResponse: onResponse
        );
  }

  void getDataByLoc(Function(String) onResponse, String id) async {
    final url = _endpoint(productByLocation);
    final Map<String, String> headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };

    final Map<String, String> body = <String, String>{
      'location_id': id,
    };
    _handleRequest<void>(
        onRequest: () => _client.post(url, headers: headers, body: body),
        onResponse: onResponse
        );
  }
}

extension on API {
  Uri _endpoint(String path) =>
      _baseUrl.replace(path: '${_baseUrl.path}$path');

  Future<T> _handleRequest<T>(
      {required Future<http.Response> Function() onRequest,
      required T Function(String) onResponse}) async {
    try {
      final response = await onRequest();

      if (response.statusCode == 200) {
        return onResponse(response.body);
      } else {
        throw ResponseFailure._(
            errorCode: response.statusCode,
            errorMessage: 'Network Response Error');
      }
    } on SocketException {
      throw const ResponseFailure._(errorMessage: 'Socket Exception');
    } on TimeoutException {
      throw const ResponseFailure._(errorMessage: 'Request Time Out Exception');
    } on ResponseFailure {
      throw "error";
    }
  }
}
