part of 'api_controller.dart';

class TException implements Exception {
  final http.Response _response;
  String _message;

  TException(http.Response response, [String message = '']) : this._response = response {
    _message =
        'TMDb fail! $message\n${JsonEncoder.withIndent('  ').convert(jsonDecode(_response.body))}';
  }

  String get message => _message;

  @override
  String toString() => '$runtimeType: $_message';
}
