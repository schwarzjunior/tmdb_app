part of 'api_tv.dart';

abstract class _ApiTvPerformers {
  final TApiData _apiData = TApiController.apiData;

  Future<Tv> _performTvDetails(int id) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/tv/'
        '${id.toString()}'
        '?api_key=${_apiData.apiKey}'
        '&language=${_apiData.language.language}'
        '&append_to_response=videos');
    return _decodeTvDetails(response);
  }

  Future<TvSeason> _performTvSeasonDetails(int tvId, int seasonNumber) async {
    http.Response response = await http.get('https://api.themoviedb.org/3'
        '/tv/$tvId'
        '/season/$seasonNumber'
        '?api_key=${_apiData.apiKey}'
        '&language=${_apiData.language.language}');
    return _decodeTvSeasonDetails(response);
  }

  Future<TvEpisode> _performTvEpisodeDetails(int tvId, int seasonNumber, int episodeNumber) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/tv'
        '/$tvId'
        '/season/$seasonNumber'
        '/episode/$episodeNumber'
        '?api_key=${_apiData.apiKey}'
        '&language=${_apiData.language.language}');
    return _decodeTvEpisodeDetails(response);
  }

  Tv _decodeTvDetails(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load tv details.');
    return decoded == null ? null : Tv.fromJson(decoded);
  }

  TvSeason _decodeTvSeasonDetails(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load tv season details.');
    return decoded == null ? null : TvSeason.fromJson(decoded);
  }

  TvEpisode _decodeTvEpisodeDetails(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load tv episode details.');
    return decoded == null ? null : TvEpisode.fromJson(decoded);
  }
}
