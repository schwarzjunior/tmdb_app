import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/search/base/search_base.dart';

class MultiSearchMovie extends TMultiSearchMediaObject {
  final int id;
  final String title;
  final DateTime releaseDate;
  final bool adult;
  final String originalTitle;
  final String originalLanguage;
  final String overview;
  final String poserPath;
  final String backdropPath;
  final int voteCount;
  final double voteAverage;
  final num popularity;

  MultiSearchMovie({
    TMediaType mediaType,
    this.id,
    this.title,
    this.releaseDate,
    this.adult,
    this.originalTitle,
    this.originalLanguage,
    this.overview,
    this.poserPath,
    this.backdropPath,
    this.voteCount,
    this.voteAverage,
    this.popularity,
  }) : super(mediaType);

  factory MultiSearchMovie.fromJson(Map<String, dynamic> json) => MultiSearchMovie(
        mediaType: TConvertersHelper.mediaTypeFromString(json['media_type'] as String),
        id: json['id'] as int,
        title: json['title'] as String,
        releaseDate: TConvertersHelper.dateTimeFromString(json['release_date'] as String),
        adult: json['adult'] as bool,
        originalTitle: json['original_title'] as String,
        originalLanguage: json['original_language'] as String,
        overview: json['overview'] as String,
        poserPath: json['poster_path'] as String,
        backdropPath: json['backdrop_path'] as String,
        voteCount: json['vote_count'] as int,
        voteAverage: (json['vote_average'] as num)?.toDouble(),
        popularity: json['popularity'] as num,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'media_type': TConvertersHelper.mediaTypeToString(mediaType),
        'id': id,
        'title': title,
        'release_date': TConvertersHelper.dateTimeToString(releaseDate),
        'adult': adult,
        'original_title': originalTitle,
        'original_language': originalLanguage,
        'overview': overview,
        'poster_path': poserPath,
        'backdrop_path': backdropPath,
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'popularity': popularity,
      };

  String getPosterUrl({TApiPosterSize size}) => TApiHelper.buildPosterUrl(poserPath, size);

  String getBackdropUrl({TApiBackdropSize size}) => TApiHelper.buildBackdropUrl(backdropPath, size);

  @override
  List<Object> get props => [
        id,
        title,
        releaseDate,
        adult,
        originalTitle,
        originalLanguage,
        overview,
        poserPath,
        backdropPath,
        voteCount,
        voteAverage,
        popularity,
        mediaType,
      ];

  @override
  String toString() => """MultiSearchMovie{
    mediaType: $mediaType,
    id: $id,
    title: $title,
    releaseDate: $releaseDate,
    adult: $adult,
    originalTitle: $originalTitle,
    originalLanguage: $originalLanguage,
    overview: $overview,
    posterPath: $poserPath,
    backdropPath: $backdropPath,
    voteCount: $voteCount,
    voteAverage: $voteAverage,
    popularity: $popularity,
  }""";
}
