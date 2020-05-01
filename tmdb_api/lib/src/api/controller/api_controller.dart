import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';

part 'api_data.dart';
part 'api_decoder.dart';
part 'api_exception.dart';

abstract class TApiControllerBase {
  final TApiData _apiData;

  TApiControllerBase({TApiData apiData}) : this._apiData = apiData;
}

class TApiController extends TApiControllerBase {
  static TApiController _instante;

  TApiController._({
    @required String apiKey,
    @required bool includeAdult,
    @required TApiConfigurationLanguage language,
    @required TApiPosterSize posterSize,
    @required TApiBackdropSize backdropSize,
    @required TApiProfileSize profileSize,
    @required TApiStillSize stillSize,
    @required TApiLogoSize logoSize,
  })  : assert(apiKey != null && includeAdult != null),
        super(
            apiData: TApiData(
          apiKey: apiKey,
          includeAdult: includeAdult,
          language: language,
          posterSize: posterSize,
          backdropSize: backdropSize,
          profileSize: profileSize,
          stillSize: stillSize,
          logoSize: logoSize,
        ));

  factory TApiController.init({
    @required String apiKey,
    @required bool includeAdult,
    TApiConfigurationLanguage language,
    TApiPosterSize posterSize,
    TApiBackdropSize backdropSize,
    TApiProfileSize profileSize,
    TApiStillSize stillSize,
    TApiLogoSize logoSize,
  }) {
    _instante = TApiController._(
      apiKey: apiKey,
      includeAdult: includeAdult,
      language: language,
      posterSize: posterSize,
      backdropSize: backdropSize,
      profileSize: profileSize,
      stillSize: stillSize,
      logoSize: logoSize,
    );
    return _instante;
  }

  factory TApiController() => _instante;

  static TApiData get apiData => _instante._apiData;
}
