part of 'api_search.dart';

abstract class _ApiSearchPerformers {
  final TApiData _apiData = TApiController.apiData;

  Future<MultiSearch> _performMultiSearch(String query, int page) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/search/multi'
        '?api_key=${_apiData.apiKey}'
        '&language=${_apiData.language.language}'
        '&query=$query'
        '&page=$page'
        '&include_adult=${_apiData.includeAdult}');
    return _decodeMultiSearch(response);
  }

  MultiSearch _decodeMultiSearch(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load multi search results.');
    return decoded == null ? null : MultiSearch.fromJson(decoded);
  }

  Future<SearchMovies> _performSearchMovies(String query, int page) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/search/movie'
        '?api_key=${_apiData.apiKey}'
        '&language=${_apiData.language.language}'
        '&query=$query'
        '&page=$page'
        '&include_adult=${_apiData.includeAdult}');
    return _decodeSearchMovies(response);
  }

  SearchMovies _decodeSearchMovies(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load movie search results.');
    return decoded == null ? null : SearchMovies.fromJson(decoded);
  }

  Future<SearchTvs> _performSearchTvs(String query, int page) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/search/tv'
        '?api_key=${_apiData.apiKey}'
        '&language=${_apiData.language.language}'
        '&query=$query'
        '&page=$page');
    return _decodeSearchTvs(response);
  }

  SearchTvs _decodeSearchTvs(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load tv search results.');
    return decoded == null ? null : SearchTvs.fromJson(decoded);
  }

  Future<SearchPersons> _performSearchPersons(String query, int page) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/search/person'
        '?api_key=${_apiData.apiKey}'
        '&language=${_apiData.language.language}'
        '&query=$query'
        '&page=$page'
        '&include_adult=${_apiData.includeAdult}');
    return _decodeSearchPersons(response);
  }

  SearchPersons _decodeSearchPersons(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load person search results.');
    return (decoded == null) ? null : SearchPersons.fromJson(decoded);
  }

  Future<SearchCompanies> _performSearchCompanies(String query, int page) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/search/company'
        '?api_key=${_apiData.apiKey}'
        '&query=$query'
        '&page=$page');
    return _decodeSearchCompanies(response);
  }

  SearchCompanies _decodeSearchCompanies(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load companies search results.');
    return decoded == null ? null : SearchCompanies.fromJson(decoded);
  }
}
