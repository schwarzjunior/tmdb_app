import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/tv/episode/tv_episode.dart';

class TvSeason extends TObject {
  final int id;
  final String textId;
  final String name;
  final String overview;
  final DateTime airDate;
  final int seasonNumber;
  final String posterPath;
  final List<TvEpisode> episodes;

  TvSeason({
    this.id,
    this.textId,
    this.name,
    this.overview,
    this.airDate,
    this.seasonNumber,
    this.posterPath,
    this.episodes,
  });

  factory TvSeason.fromJson(Map<String, dynamic> json) => TvSeason(
        id: json['id'] as int,
        textId: json['_id'] as String,
        name: json['name'] as String,
        overview: json['overview'] as String,
        airDate: TConvertersHelper.dateTimeFromString(json['air_date'] as String),
        seasonNumber: json['season_number'] as int,
        posterPath: json['poster_path'] as String,
        episodes: (json['episodes'] as List)
            ?.map((e) => e == null ? null : TvEpisode.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        '_id': textId,
        'name': name,
        'overview': overview,
        'air_date': TConvertersHelper.dateTimeToString(airDate),
        'season_number': seasonNumber,
        'poster_path': posterPath,
        'episodes': episodes?.map((e) => e.toJson())?.toList(),
      };

  String getPosterUrl({TApiPosterSize size}) => TApiHelper.buildPosterUrl(posterPath, size);

  @override
  List<Object> get props => [
        id,
        textId,
        name,
        overview,
        airDate,
        seasonNumber,
        posterPath,
        episodes,
      ];

  @override
  String toString() => """TvSeason{
    id: $id,
    textId: $textId,
    name: $name,
    overview: $overview,
    airDate: $airDate,
    seasonNumber: $seasonNumber,
    posterPath: $posterPath,
    episodes: $episodes,
  }""";
}
