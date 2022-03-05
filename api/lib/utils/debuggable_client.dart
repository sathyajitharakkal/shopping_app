
part of api;

class _DebuggableClient implements http.Client {
  final http.Client _client;

  _DebuggableClient(this._client);

  @override
  void close() => _client.close();

  @override
  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final requestId = const Uuid().v4();
    print('[HTTP] [$requestId] method=DELETE');
    print('[HTTP] [$requestId] url=$url');
    print('[HTTP] [$requestId] headers=$headers');
    print('[HTTP] [$requestId] body=$body');
    print('[HTTP] [$requestId] encoding=$encoding');
    Stopwatch stopwatch = Stopwatch()..start();
    try {
      final result = await _client.delete(url,
          headers: headers, body: body, encoding: encoding);

      print('[HTTP] [$requestId] $url took ${stopwatch.elapsedMilliseconds}');
      return result;
    } catch (e) {
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    final requestId = const Uuid().v4();
    print('[HTTP] [$requestId] method=GET');
    print('[HTTP] [$requestId] url=$url');
    print('[HTTP] [$requestId] headers=$headers');
    Stopwatch stopwatch = Stopwatch()..start();
    try {
      final result = await _client.get(url, headers: headers);

      print('[HTTP] [$requestId] $url took ${stopwatch.elapsedMilliseconds}');
      return result;
    } catch (e) {
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) async {
    final requestId = const Uuid().v4();
    print('[HTTP] [$requestId] method=HEAD');
    print('[HTTP] [$requestId] url=$url');
    print('[HTTP] [$requestId] headers=$headers');
    Stopwatch stopwatch = Stopwatch()..start();
    try {
      final result = await _client.head(url, headers: headers);

      print('[HTTP] [$requestId] $url took ${stopwatch.elapsedMilliseconds}');
      return result;
    } catch (e) {
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }

  @override
  Future<http.Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final requestId = const Uuid().v4();
    print('[HTTP] [$requestId] method=PATCH');
    print('[HTTP] [$requestId] url=$url');
    print('[HTTP] [$requestId] headers=$headers');
    print('[HTTP] [$requestId] body=$body');
    print('[HTTP] [$requestId] encoding=$encoding');
    Stopwatch stopwatch = Stopwatch()..start();
    try {
      final result = await _client.patch(url,
          headers: headers, body: body, encoding: encoding);

      print('[HTTP] [$requestId] $url took ${stopwatch.elapsedMilliseconds}');
      return result;
    } catch (e) {
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final requestId = const Uuid().v4();
    print('[HTTP] [$requestId] method=POST');
    print('[HTTP] [$requestId] url=$url');
    print('[HTTP] [$requestId] headers=$headers');
    print('[HTTP] [$requestId] body=$body');
    print('[HTTP] [$requestId] encoding=$encoding');
    Stopwatch stopwatch = Stopwatch()..start();
    try {
      final result = await _client.post(url,
          headers: headers, body: body, encoding: encoding);

      print('[HTTP] [$requestId] $url took ${stopwatch.elapsedMilliseconds}');
      return result;
    } catch (e) {
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }

  @override
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final requestId = const Uuid().v4();
    print('[HTTP] [$requestId] method=PUT');
    print('[HTTP] [$requestId] url=$url');
    print('[HTTP] [$requestId] headers=$headers');
    print('[HTTP] [$requestId] body=$body');
    print('[HTTP] [$requestId] encoding=$encoding');
    Stopwatch stopwatch = Stopwatch()..start();
    
    try {
      final result = await _client.put(url,
          headers: headers, body: body, encoding: encoding);

      print('[HTTP] [$requestId] $url took ${stopwatch.elapsedMilliseconds}');
      return result;
    } catch (e) {
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) =>
      _client.read(url, headers: headers);

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) =>
      _client.readBytes(url, headers: headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) =>
      _client.send(request);
}