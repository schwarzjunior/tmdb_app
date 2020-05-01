import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/search/base/search_base.dart';

class MultiSearchTv extends TMultiSearchMediaObject {
  final int id;
  final String name;
  final String originalName;
  final DateTime firstAirDate;
  final String overview;
  final String originalLanguage;
  final List<String> originCountry;
  final int voteCount;
  final double voteAverage;
  final num popularity;
  final String posterPath;
  final String backdropPath;

  MultiSearchTv({
    TMediaType mediaType,
    this.id,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.overview,
    this.originalLanguage,
    this.originCountry,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
  }) : super(mediaType);

  factory MultiSearchTv.fromJson(Map<String, dynamic> json) => MultiSearchTv(
        mediaType: TConvertersHelper.mediaTypeFromString(json['media_type'] as String),
        id: json['id'] as int,
        name: json['name'] as String,
        originalName: json['original_name'] as String,
        firstAirDate: TConvertersHelper.dateTimeFromString(json['first_air_date'] as String),
        overview: json['overview'] as String,
        originalLanguage: json['original_language'] as String,
        originCountry: (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
        voteCount: json['vote_count'] as int,
        voteAverage: (json['vote_average'] as num)?.toDouble(),
        popularity: json['popularity'] as num,
        posterPath: json['poster_path'] as String,
        backdropPath: json['backdrop_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'media_type': TConvertersHelper.mediaTypeToString(mediaType),
        'id': id,
        'name': name,
        'original_name': originalName,
        'first_air_date': TConvertersHelper.dateTimeToString(firstAirDate),
        'overview': overview,
        'original_language': originalLanguage,
        'origin_country': originCountry,
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'popularity': popularity,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
      };

  String getPosterUrl({TApiPosterSize size}) => TApiHelper.buildPosterUrl(posterPath, size);

  String getBackdropUrl({TApiBackdropSize size}) => TApiHelper.buildBackdropUrl(backdropPath, size);

  @override
  List<Object> get props => [
        id,
        name,
        originalName,
        firstAirDate,
        overview,
        originalLanguage,
        originCountry,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        mediaType,
      ];

  @override
  String toString() => """MultiSearchTv{
    mediaType: $mediaType,
    id: $id,
    name: $name,
    originalName: $originalName,
    firstAirDate: $firstAirDate,
    overview: $overview,
    originalLanguage: $originalLanguage,
    originCountry: $originCountry,
    voteCount: $voteCount,
    voteAverage: $voteAverage,
    popularity: $popularity,
    posterPath: $posterPath,
    backdropPath: $backdropPath,
  }""";
}
