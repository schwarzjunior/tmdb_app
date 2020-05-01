import 'package:tmdb_api/src/models/base/base.dart';

abstract class TSingleSearchMediaObject extends TObject {
  final int page;
  final int totalPages;
  final int totalResults;

  TSingleSearchMediaObject({
    this.page,
    this.totalPages,
    this.totalResults,
  });

  bool get hasNextPage => page < totalPages;

  Map<String, dynamic> toJson();
}

abstract class TMultiSearchMediaObject extends TObject {
  final TMediaType mediaType;

  TMultiSearchMediaObject(this.mediaType);

  Map<String, dynamic> toJson();
}
