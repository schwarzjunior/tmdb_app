part of 'api_controller.dart';

dynamic checkThenDecode(http.Response response, [String message]) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 401:
      return TException(response, 'Invalid API key: You must be granted a valid key.');
    case 404:
      throw TException(response, 'The resource you requested could not be found.');
    default:
      throw TException(response, message ?? '');
  }
}
