import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/api/controller/api_controller.dart';

abstract class TApiHelper {
  static const _apiImageUrlPrefix = 'https://image.tmdb.org/t/p/';
  static const _apiVideoUrlPrefix = 'https://www.youtube.com/watch?v=';

  static String buildPosterUrl(String uri, [TApiPosterSize size]) {
    return uri == null
        ? null
        : '$_apiImageUrlPrefix${(size ?? TApiController.apiData.posterSize).size}$uri';
  }

  static String buildBackdropUrl(String uri, [TApiBackdropSize size]) {
    return uri == null
        ? null
        : '$_apiImageUrlPrefix${(size ?? TApiController.apiData.backdropSize).size}$uri';
  }

  static String buildStillUrl(String uri, [TApiStillSize size]) {
    return uri == null
        ? null
        : '$_apiImageUrlPrefix${(size ?? TApiController.apiData.stillSize).size}$uri';
  }

  static String buildProfileUrl(String uri, [TApiProfileSize size]) {
    return uri == null
        ? null
        : '$_apiImageUrlPrefix${(size ?? TApiController.apiData.profileSize).size}$uri';
  }

  static String buildLogoUrl(String uri, [TApiLogoSize size]) {
    return uri == null
        ? null
        : '$_apiImageUrlPrefix${(size ?? TApiController.apiData.logoSize).size}$uri';
  }

  static String buildVideoUrl(String uri) => (uri == null) ? null : '$_apiVideoUrlPrefix$uri';
}
