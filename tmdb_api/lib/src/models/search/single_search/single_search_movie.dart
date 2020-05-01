import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';

class SingleSearchMovie extends TMediaObject {
  final String title;
  final String originalTitle;
  final String originalLanguage;
  final String overview;
  final DateTime releaseDate;
  final bool adult;
  final List<int> genreIds;
  final int voteCount;
  final double voteAverage;
  final num popularity;
  final String posterPath;
  final String backdropPath;

  SingleSearchMovie({
    int id,
    this.title,
    this.originalTitle,
    this.originalLanguage,
    this.overview,
    this.releaseDate,
    this.adult,
    this.genreIds,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
  }) : super(id);

  factory SingleSearchMovie.fromJson(Map<String, dynamic> json) => SingleSearchMovie(
        id: json['id'] as int,
        title: json['title'] as String,
        originalTitle: json['original_title'] as String,
        originalLanguage: json['original_language'] as String,
        overview: json['overview'] as String,
        releaseDate: TConvertersHelper.dateTimeFromString(json['release_date'] as String),
        adult: json['adult'] as bool,
        genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
        voteCount: json['vote_count'] as int,
        voteAverage: (json['vote_average'] as num)?.toDouble(),
        popularity: json['popularity'] as num,
        posterPath: json['poster_path'] as String,
        backdropPath: json['backdrop_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'original_title': originalTitle,
        'original_language': originalLanguage,
        'overview': overview,
        'release_date': TConvertersHelper.dateTimeToString(releaseDate),
        'adult': adult,
        'genre_ids': genreIds,
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
        title,
        originalTitle,
        originalLanguage,
        overview,
        releaseDate,
        adult,
        genreIds,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
      ];

  @override
  String toString() => """SingleSearchMovie{
    id: $id,
    title: $title,
    originalTitle: $originalTitle,
    originalLanguage: $originalLanguage,
    overview: $overview,
    releaseDate: $releaseDate,
    adult: $adult,
    genreIds: $genreIds,
    voteCount: $voteCount,
    voteAverage: $voteAverage,
    popularity: $popularity,
    posterPath: $posterPath,
    backdropPath: $backdropPath,
  }""";
}
