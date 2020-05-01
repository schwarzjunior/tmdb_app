import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/tv/tv_objects.dart';

class Tv extends TMediaObject {
  final String name;
  final String overview;
  final DateTime firstAirDate;
  final DateTime lastAirDate;
  final String homepage;
  final bool inProduction;
  final List<String> languages;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final List<int> episodeRunTime;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final int voteCount;
  final double voteAverage;
  final num popularity;
  final String status;
  final String posterPath;
  final String backdropPath;
  final String type;
  // TODO: Adicionar List<PersonGenre> genres
  final List<TvCreatedBy> createdBy;
  final TvLastEpisodeToAir lastEpisodeToAir;
  final List<TvNetwork> networks;
  final List<TvProductionCompany> productionCompanies;
  final List<TvSeasonResumed> seasons;
  final List<TvVideo> videos;

  Tv({
    int id,
    this.name,
    this.overview,
    this.firstAirDate,
    this.lastAirDate,
    this.homepage,
    this.inProduction,
    this.languages,
    this.numberOfSeasons,
    this.numberOfEpisodes,
    this.episodeRunTime,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.status,
    this.posterPath,
    this.backdropPath,
    this.type,
    this.createdBy,
    this.lastEpisodeToAir,
    this.networks,
    this.productionCompanies,
    this.seasons,
    this.videos,
  }) : super(id);

  factory Tv.fromJson(Map<String, dynamic> json) => Tv(
        id: json['id'] as int,
        name: json['name'] as String,
        overview: json['overview'] as String,
        firstAirDate: TConvertersHelper.dateTimeFromString(json['first_air_date'] as String),
        lastAirDate: TConvertersHelper.dateTimeFromString(json['last_air_date'] as String),
        homepage: json['homepage'] as String,
        inProduction: json['in_production'] as bool,
        languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
        numberOfSeasons: json['number_of_seasons'] as int,
        numberOfEpisodes: json['number_of_episodes'] as int,
        episodeRunTime: (json['episode_run_time'] as List)?.map((e) => e as int)?.toList(),
        originCountry: (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
        originalLanguage: json['original_language'] as String,
        originalName: json['original_name'] as String,
        voteCount: json['vote_count'] as int,
        voteAverage: (json['vote_average'] as num)?.toDouble(),
        popularity: json['popularity'] as num,
        status: json['status'] as String,
        posterPath: json['poster_path'] as String,
        backdropPath: json['backdrop_path'] as String,
        type: json['type'] as String,
        createdBy: (json['created_by'] as List)
            ?.map((e) => e == null ? null : TvCreatedBy.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        lastEpisodeToAir: json['last_episode_to_air'] == null
            ? null
            : TvLastEpisodeToAir.fromJson(json['last_episode_to_air'] as Map<String, dynamic>),
        networks: (json['networks'] as List)
            ?.map((e) => e == null ? null : TvNetwork.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        productionCompanies: (json['production_companies'] as List)
            ?.map((e) => e == null ? null : TvProductionCompany.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        seasons: (json['seasons'] as List)
            ?.map((e) => e == null ? null : TvSeasonResumed.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        videos: json['videos'] == null
            ? null
            : (json['videos']['results'] as List)
                ?.map((e) => e == null ? null : TvVideo.fromJson(e as Map<String, dynamic>))
                ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'overview': overview,
        'first_air_date': TConvertersHelper.dateTimeToString(firstAirDate),
        'last_air_date': TConvertersHelper.dateTimeToString(lastAirDate),
        'homepage': homepage,
        'in_production': inProduction,
        'languages': languages,
        'number_of_seasons': numberOfSeasons,
        'number_of_episodes': numberOfEpisodes,
        'episode_run_time': episodeRunTime,
        'origin_country': originCountry,
        'original_language': originalLanguage,
        'original_name': originalName,
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'popularity': popularity,
        'status': status,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
        'type': type,
        'created_by': createdBy?.map((e) => e.toJson())?.toList(),
        'last_episode_to_air': lastEpisodeToAir.toJson(),
        'networks': networks?.map((e) => e.toJson())?.toList(),
        'production_companies': productionCompanies?.map((e) => e.toJson())?.toList(),
        'seasons': seasons?.map((e) => e.toJson())?.toList(),
        'videos': <String, dynamic>{
          'results': videos?.map((e) => e.toJson())?.toList(),
        },
      };

  String getPosterUrl({TApiPosterSize size}) => TApiHelper.buildPosterUrl(posterPath, size);

  String getBackdropUrl(TApiBackdropSize size) => TApiHelper.buildBackdropUrl(backdropPath, size);

  @override
  List<Object> get props => [
        id,
        name,
        overview,
        firstAirDate,
        lastAirDate,
        homepage,
        inProduction,
        languages,
        numberOfSeasons,
        numberOfEpisodes,
        episodeRunTime,
        originCountry,
        originalLanguage,
        originalName,
        voteCount,
        voteAverage,
        popularity,
        status,
        posterPath,
        backdropPath,
        type,
        createdBy,
        lastEpisodeToAir,
        networks,
        productionCompanies,
        seasons,
        videos,
      ];

  @override
  String toString() => """Tv{
    id: $id,
    name: $name,
    overview: $overview,
    firstAirDate: $firstAirDate,
    lastAirDate: $lastAirDate,
    homepage: $homepage,
    inProduction: $inProduction,
    languages: $languages,
    numberOfSeasons: $numberOfEpisodes,
    numberOfEpisodes: $numberOfSeasons,
    episodeRunTime: $episodeRunTime,
    originCountry: $originCountry,
    originalLanguage: $originalLanguage,
    originalName: $originalName,
    voteCount: $voteCount,
    voteAverage: $voteAverage,
    popularity: $popularity,
    status: $status,
    posterPath: $posterPath,
    backdropPath: $backdropPath,
    type: $type,
    createdBy: $createdBy,
    lastEpisodeToAir: $lastEpisodeToAir,
    networks: $networks,
    productionCompanies: $productionCompanies,
    seasons: $seasons,
    videos: $videos,
  }""";
}
