import 'package:http/http.dart' as http;
import 'package:tmdb_api/src/api/controller/api_controller.dart';
import 'package:tmdb_api/src/models/search/single_search.dart';
import 'package:tmdb_api/src/models/tmdb_models.dart';

part 'api_search_performers.dart';

class ApiSearch extends _ApiSearchPerformers {
  MultiSearch _multiSearch;
  SearchMovies _searchMovies;
  SearchTvs _searchTvs;
  SearchPersons _searchPersons;
  SearchCompanies _searchCompanies;
  String _currentQuery;

  void _resetSearches() {
    _multiSearch = null;
    _searchMovies = null;
    _searchTvs = null;
    _searchPersons = null;
    _searchCompanies = null;
  }

  void _setCurrentQuery(String query) {
    _resetSearches();
    _currentQuery = (query == null ?? query.isEmpty) ? ' ' : query;
  }

  int _getNextPage(int page) => (page ?? 0) + 1;

  Future<MultiSearch> multiSearch(String query) async {
    _setCurrentQuery(query);
    _multiSearch = await _performMultiSearch(_currentQuery, 1);
    return _multiSearch;
  }

  Future<MultiSearch> multiSearchNextPage() async {
    _multiSearch = await _performMultiSearch(_currentQuery, _getNextPage(_multiSearch?.page));
    return _multiSearch;
  }

  Future<SearchMovies> searchMovies(String query) async {
    _setCurrentQuery(query);
    _searchMovies = await _performSearchMovies(_currentQuery, 1);
    return _searchMovies;
  }

  Future<SearchMovies> searchMoviesNextPage() async {
    _searchMovies = await _performSearchMovies(_currentQuery, _getNextPage(_searchMovies?.page));
    return _searchMovies;
  }

  Future<SearchTvs> searchTvs(String query) async {
    _setCurrentQuery(query);
    _searchTvs = await _performSearchTvs(_currentQuery, 1);
    return _searchTvs;
  }

  Future<SearchTvs> searchTvsNextPage() async {
    _searchTvs = await _performSearchTvs(_currentQuery, _getNextPage(_searchTvs?.page));
    return _searchTvs;
  }

  Future<SearchPersons> searchPersons(String query) async {
    _setCurrentQuery(query);
    _searchPersons = await _performSearchPersons(_currentQuery, 1);
    return _searchPersons;
  }

  Future<SearchPersons> searchPersonsNextPage() async {
    _searchPersons = await _performSearchPersons(_currentQuery, _getNextPage(_searchPersons?.page));
    return _searchPersons;
  }

  Future<SearchCompanies> searchCompanies(String query) async {
    _setCurrentQuery(query);
    _searchCompanies = await _performSearchCompanies(_currentQuery, 1);
    return _searchCompanies;
  }

  Future<SearchCompanies> searchCompaniesNextPage() async {
    _searchCompanies =
        await _performSearchCompanies(_currentQuery, _getNextPage(_searchCompanies?.page));
    return _searchCompanies;
  }
}
