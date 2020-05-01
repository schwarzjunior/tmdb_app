import 'package:tmdb_api/src/models/company/company_objects.dart';
import 'package:tmdb_api/src/models/search/base/search_base.dart';

class SearchCompanies extends TSingleSearchMediaObject {
  final List<CompanyParent> results;

  SearchCompanies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page: page, totalPages: totalPages, totalResults: totalResults);

  factory SearchCompanies.fromJson(Map<String, dynamic> json) => SearchCompanies(
        page: json['page'] as int,
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
        results: (json['results'] as List)
            ?.map((e) => e == null ? null : CompanyParent.fromJson(e as Map<String, dynamic>))
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
  String toString() => """SearchCompanies{
    page: $page,
    totalPages: $totalPages,
    totalResults: $totalResults,
    results: $results,
  }""";
}
