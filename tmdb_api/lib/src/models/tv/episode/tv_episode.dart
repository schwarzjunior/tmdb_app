import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/tv/episode/tv_episode_objects.dart';

class TvEpisode extends TObject {
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int seasonNumber;
  final int episodeNumber;
  final DateTime airDate;
  final String stillPath;
  final int voteCount;
  final double voteAverage;
  final List<TvEpisodeCrew> crew;
  final List<TvEpisodeGuestStar> guestStars;

  TvEpisode({
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.episodeNumber,
    this.airDate,
    this.stillPath,
    this.voteCount,
    this.voteAverage,
    this.crew,
    this.guestStars,
  });

  factory TvEpisode.fromJson(Map<String, dynamic> json) => TvEpisode(
        id: json['id'] as int,
        name: json['name'] as String,
        overview: json['overview'] as String,
        productionCode: json['production_code'] as String,
        seasonNumber: json['season_number'] as int,
        episodeNumber: json['episode_number'] as int,
        airDate: TConvertersHelper.dateTimeFromString(json['air_date'] as String),
        stillPath: json['still_path'] as String,
        voteCount: json['vote_count'] as int,
        voteAverage: (json['vote_average'] as num)?.toDouble(),
        crew: (json['crew'] as List)
            ?.map((e) => e == null ? null : TvEpisodeCrew.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        guestStars: (json['guest_stars'] as List)
            ?.map((e) => e == null ? null : TvEpisodeGuestStar.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'overview': overview,
        'production_code': productionCode,
        'season_number': seasonNumber,
        'episode_number': episodeNumber,
        'air_date': TConvertersHelper.dateTimeToString(airDate),
        'still_path': stillPath,
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'crew': crew?.map((e) => e.toJson())?.toList(),
        'guest_stars': guestStars?.map((e) => e.toJson())?.toList(),
      };

  String getStillUrl({TApiStillSize size}) => TApiHelper.buildStillUrl(stillPath, size);

  @override
  List<Object> get props => [
        id,
        name,
        overview,
        productionCode,
        seasonNumber,
        episodeNumber,
        airDate,
        stillPath,
        voteCount,
        voteAverage,
        crew,
        guestStars,
      ];

  @override
  String toString() => """TvEpisode{
    id: $id,
    name: $name,
    overview: $overview,
    productionCode: $productionCode,
    seasonNumber: $seasonNumber,
    episodeNumber: $episodeNumber,
    airDate: $airDate,
    stillPath: $stillPath,
    voteCount: $voteCount,
    voteAverage: $voteAverage,
    crew: $crew,
    guestStars: $guestStars,
  }""";
}
