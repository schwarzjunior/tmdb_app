import 'package:tmdb_api/src/models/search/base/search_base.dart';
import 'package:tmdb_api/src/models/search/single_search/single_search_movie.dart';
import 'package:tmdb_api/src/models/search/single_search/single_search_person.dart';
import 'package:tmdb_api/src/models/search/single_search/single_search_tv.dart';

class SearchMovies extends TSingleSearchMediaObject {
  final List<SingleSearchMovie> results;

  SearchMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page: page, totalPages: totalPages, totalResults: totalResults);

  factory SearchMovies.fromJson(Map<String, dynamic> json) => SearchMovies(
        page: json['page'] as int,
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
        results: (json['results'] as List)
            ?.map((e) => e == null ? null : SingleSearchMovie.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'total_pages': totalPages,
        'total_results': totalResults,
        'results': results?.map((e) => e.toJson())?.toList(),
      };

  @override
  List<Object> get props => [page, totalPages, totalResults, results];

  @override
  String toString() => """SearchMovies{
    page: $page,
    totalPages: $totalPages,
    totalResults: $totalResults,
    results: $results,
  }""";
}

class SearchTvs extends TSingleSearchMediaObject {
  final List<SingleSearchTv> results;

  SearchTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page: page, totalPages: totalPages, totalResults: totalResults);

  factory SearchTvs.fromJson(Map<String, dynamic> json) => SearchTvs(
        page: json['page'] as int,
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
        results: (json['results'] as List)
            ?.map((e) => e == null ? null : SingleSearchTv.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'total_pages': totalPages,
        'total_results': totalResults,
        'results': results?.map((e) => e.toJson())?.toList(),
      };

  @override
  List<Object> get props => [page, totalPages, totalResults, results];

  @override
  String toString() => """SearchTvs{
    page: $page,
    totalPages: $totalPages,
    totalResults: $totalResults,
    results: $results,
  }""";
}

class SearchPersons extends TSingleSearchMediaObject {
  final List<SingleSearchPerson> results;

  SearchPersons({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page: page, totalPages: totalPages, totalResults: totalResults);

  factory SearchPersons.fromJson(Map<String, dynamic> json) => SearchPersons(
        page: json['page'] as int,
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
        results: (json['results'] as List)
            ?.map((e) => e == null ? null : SingleSearchPerson.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'total_pages': totalPages,
        'total_results': totalResults,
        'results': results?.map((e) => e.toJson())?.toList(),
      };

  @override
  List<Object> get props => [page, totalPages, totalResults, results];

  @override
  String toString() => """SearchPersons{
    page: $page,
    totalPages: $totalPages,
    totalResults: $totalResults,
    results: $results,
  }""";
}
