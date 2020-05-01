import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/search/base/search_base.dart';
import 'package:tmdb_api/src/models/search/multi_search/multi_search_movie.dart';
import 'package:tmdb_api/src/models/search/multi_search/multi_search_person.dart';
import 'package:tmdb_api/src/models/search/multi_search/multi_search_tv.dart';

class MultiSearch<T extends TMultiSearchMediaObject> extends TObject {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<T> results;

  MultiSearch({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  factory MultiSearch.fromJson(Map<String, dynamic> json) => MultiSearch(
        page: json['page'] as int,
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
        results: (json['results'] as List)?.map<T>((e) {
          if (e.containsKey('media_type')) {
            switch (e['media_type']) {
              case 'movie':
                return MultiSearchMovie.fromJson(e) as T;
              case 'tv':
                return MultiSearchTv.fromJson(e) as T;
              case 'person':
                return MultiSearchPerson.fromJson(e) as T;
            }
          }
          // FIXME: Se o 'media_type' for igual a other, resultara em um erro aqui!
          return e as T;
        })?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'total_pages': totalPages,
        'total_results': totalResults,
        'results': results?.map((e) => e.toJson())?.toList(),
      };

  bool get hasNextPage => page < totalPages;

  @override
  List<Object> get props => [page, totalPages, totalResults, results];

  @override
  String toString() => """MultiSearch{
    page: $page,
    totalPages: $totalPages,
    totalResults: $totalResults,
    results: $results,
  }""";
}
