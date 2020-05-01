import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_api/src/api/configuration/api_configuration.dart';
import 'package:tmdb_api/src/models/configuration/configuration.dart';
import 'package:tmdb_api/src/models/configuration/configuration_languages.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  _initApi();

  group('configuration', () {
    final TApiConfiguration apiConfiguration = TApiConfiguration();

    test('configuration', () async {
      var results = await apiConfiguration.configuration();
      assert(TConfiguration.fromJson(_reencode(results)) == results);
      assert(TConfiguration.fromJson(results.toJson()) == results);
      _printResults('Configuration', results);
    });

    test('configuration languages', () async {
      var results = await apiConfiguration.configurationLanguages();
      assert(TConfigurationLanguages.fromJson(_reencode(results)) == results);
      assert(TConfigurationLanguages.fromJson(results.toJson()) == results);
      _printResults('Configuration Languages', results);
    });
  });

  group('movie', () {
    final ApiMovie apiMovie = ApiMovie();

    test('movie details', () async {
      var results = await apiMovie.movieDetails(475557);
      assert(Movie.fromJson(_reencode(results)) == results);
      assert(Movie.fromJson(results.toJson()) == results);
      _printResults('Movie Details', results);
    });
  });

  group('tv', () {
    final ApiTv apiTv = ApiTv();

    test('tv details', () async {
      var results = await apiTv.tvDetails(67198);
      assert(Tv.fromJson(_reencode(results)) == results);
      assert(Tv.fromJson(results.toJson()) == results);
      _printResults('Tv Details', results);
    });

    test('tv season details', () async {
      var results = await apiTv.tvSeasonDetails(71912, 1);
      assert(TvSeason.fromJson(_reencode(results)) == results);
      assert(TvSeason.fromJson(results.toJson()) == results);
      _printResults('Tv Season Details', results);
    });

    test('tv episode details', () async {
      var results = await apiTv.tvEpisodeDetails(71912, 1, 1);
      assert(TvEpisode.fromJson(_reencode(results)) == results);
      assert(TvEpisode.fromJson(results.toJson()) == results);
      _printResults('Tv Episode Details', results);
    });
  });

  group('search', () {
    final ApiSearch apiSearch = ApiSearch();

    test('single search movies', () async {
      var results = await apiSearch.searchMovies('superman');
      if (results.hasNextPage) results = await apiSearch.searchMoviesNextPage();
      assert(SearchMovies.fromJson(_reencode(results)) == results);
      assert(SearchMovies.fromJson(results.toJson()) == results);
      _printResults('SingleSearch Movies', results);
    });

    test('single search tvs', () async {
      var results = await apiSearch.searchTvs('friends');
      if (results.hasNextPage) results = await apiSearch.searchTvsNextPage();
      assert(SearchTvs.fromJson(_reencode(results)) == results);
      assert(SearchTvs.fromJson(results.toJson()) == results);
      _printResults('SingleSearch Tvs', results);
    });

    test('single search persons', () async {
      var results = await apiSearch.searchPersons('natalie portman');
      assert(SearchPersons.fromJson(_reencode(results)) == results);
      assert(SearchPersons.fromJson(results.toJson()) == results);
      _printResults('SingleSearch Persons', results);
    });

    test('single search companies', () async {
      var results = await apiSearch.searchCompanies('fox');
      if (results.hasNextPage) results = await apiSearch.searchCompaniesNextPage();
      assert(SearchCompanies.fromJson(_reencode(results)) == results);
      assert(SearchCompanies.fromJson(results.toJson()) == results);
      _printResults('SingleSearch Companies', results);
    });

    test('multi search', () async {
      var results = await apiSearch.multiSearch('natalie portman');
      // var results = await apiSearch.multiSearch('friends');
      // var results = await apiSearch.multiSearch('superman');
      // if (results.hasNextPage) results = await apiSearch.multiSearchNextPage();
      assert(MultiSearch.fromJson(_reencode(results)) == results);
      assert(MultiSearch.fromJson(results.toJson()) == results);
      _printResults('MultiSearch', results);
    });
  });
}

void _initApi() {
  TApiController.init(
    apiKey: 'ffea4ca1099c6f945cfe912e08056be2',
    includeAdult: true,
    language: TApiConfigurationLanguage.pt_BR,
    posterSize: TApiPosterSize.w342,
    backdropSize: TApiBackdropSize.w300,
    profileSize: TApiProfileSize.w185,
    stillSize: TApiStillSize.w300,
    logoSize: TApiLogoSize.w300,
  );
}

dynamic _reencode(dynamic results) {
  final encoded = jsonEncode(results);
  return jsonDecode(encoded);
}

void _printResults(String title, dynamic text, [int lineWidth = 70]) {
  print('┌${''.padLeft(lineWidth - 2, '─')}┐\n'
      '│${title.padLeft(((lineWidth - 2 + title.length) / 2).truncate()).padRight(lineWidth - 2)}│\n'
      '└${''.padLeft(lineWidth - 2, '─')}┘\n'
      '\n${text.toString()}');
}
