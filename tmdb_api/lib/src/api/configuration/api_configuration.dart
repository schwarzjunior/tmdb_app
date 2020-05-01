import 'package:http/http.dart' as http;
import 'package:tmdb_api/src/api/controller/api_controller.dart';
import 'package:tmdb_api/src/models/configuration/configuration.dart';
import 'package:tmdb_api/src/models/configuration/configuration_languages.dart';

class TApiConfiguration {
  final TApiData _apiData = TApiController.apiData;

  Future<TConfiguration> configuration() async {
    http.Response response = await http.get('https://api.themoviedb.org/3/configuration'
        '?api_key=${_apiData.apiKey}');
    return _decodeConfiguration(response);
  }

  TConfiguration _decodeConfiguration(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load configuration.');
    return decoded == null ? null : TConfiguration.fromJson(decoded);
  }

  Future<TConfigurationLanguages> configurationLanguages() async {
    http.Response response = await http.get('https://api.themoviedb.org/3/configuration'
        '/languages'
        '?api_key=${_apiData.apiKey}');
    return _decodeConfigurationLanguages(response);
  }

  TConfigurationLanguages _decodeConfigurationLanguages(http.Response response) {
    final decoded = checkThenDecode(response);
    final Map<String, dynamic> map = <String, dynamic>{'languages': decoded};
    return decoded == null ? null : TConfigurationLanguages.fromJson(map);
  }
}
