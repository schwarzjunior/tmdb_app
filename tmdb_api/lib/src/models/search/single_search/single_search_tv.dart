import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';

class SingleSearchTv extends TMediaObject {
  final String name;
  final String originalName;
  final String originalLanguage;
  final String overview;
  final DateTime firstAirDate;
  final int voteCount;
  final double voteAverage;
  final num popularity;
  final String posterPath;
  final String backdropPath;
  final List<String> originCountry;

  SingleSearchTv({
    int id,
    this.name,
    this.originalName,
    this.originalLanguage,
    this.overview,
    this.firstAirDate,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.originCountry,
  }) : super(id);

  factory SingleSearchTv.fromJson(Map<String, dynamic> json) => SingleSearchTv(
        id: json['id'] as int,
        name: json['name'] as String,
        originalName: json['original_name'] as String,
        originalLanguage: json['original_language'] as String,
        overview: json['overview'] as String,
        firstAirDate: TConvertersHelper.dateTimeFromString(json['first_air_date'] as String),
        voteCount: json['vote_count'] as int,
        voteAverage: (json['vote_average'] as num)?.toDouble(),
        popularity: json['popularity'] as num,
        posterPath: json['poster_path'] as String,
        backdropPath: json['backdrop_path'] as String,
        originCountry: (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'original_name': originalName,
        'original_language': originalLanguage,
        'overview': overview,
        'first_air_date': TConvertersHelper.dateTimeToString(firstAirDate),
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'popularity': popularity,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
        'origin_country': originCountry,
      };

  String getPosterUrl({TApiPosterSize size}) => TApiHelper.buildPosterUrl(posterPath, size);

  String getBackdropUrl({TApiBackdropSize size}) => TApiHelper.buildBackdropUrl(backdropPath, size);

  @override
  List<Object> get props => [
        id,
        name,
        originalName,
        originalLanguage,
        overview,
        firstAirDate,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        originCountry,
      ];

  @override
  String toString() => """SingleSearchTv{
    id: $id,
    name: $name,
    originalName: $originalName,
    originalLanguage: $originalLanguage,
    overview: $overview,
    firstAirDate: $firstAirDate,
    voteCount: $voteCount,
    voteAverage: $voteAverage,
    popularity: $popularity,
    posterPath: $posterPath,
    backdropPath: $backdropPath,
    originCountry: $originCountry,
  }""";
}
