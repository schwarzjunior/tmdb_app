import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';

class TvVideo extends TObject {
  final String id;
  final String name;
  final String key;
  final String site;
  final String type;
  final int size;

  TvVideo({
    this.id,
    this.name,
    this.key,
    this.site,
    this.type,
    this.size,
  });

  factory TvVideo.fromJson(Map<String, dynamic> json) => TvVideo(
        id: json['id'] as String,
        name: json['name'] as String,
        key: json['key'] as String,
        site: json['site'] as String,
        type: json['type'] as String,
        size: json['size'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'key': key,
        'site': site,
        'type': type,
        'size': size,
      };

  String get youtubeVideoUrl => TApiHelper.buildVideoUrl(key);

  @override
  List<Object> get props => [id, name, key, site, type, size];

  @override
  String toString() => """TvVideo{
    id: $id,
    name: $name,
    key: $key,
    site: $site,
    type: $type,
    size: $size,
  }""";
}

class TvCreatedBy extends TObject {
  final int id;
  final String creditId;
  final String name;
  final TGender gender;
  final String profilePath;

  TvCreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  factory TvCreatedBy.fromJson(Map<String, dynamic> json) => TvCreatedBy(
        id: json['id'] as int,
        creditId: json['credit_id'] as String,
        name: json['name'] as String,
        gender: TConvertersHelper.genderFromInt(json['gender'] as int),
        profilePath: json['profile_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'credit_id': creditId,
        'name': name,
        'gender': TConvertersHelper.genderToInt(gender),
        'profile_path': profilePath,
      };

  String getProfileUrl({TApiProfileSize size}) => TApiHelper.buildProfileUrl(profilePath, size);

  @override
  List<Object> get props => [id, creditId, name, gender, profilePath];

  @override
  String toString() => """TvCreatedBy{
    id: $id,
    creditId: $creditId,
    name: $name,
    gender: $gender,
    profilePath: $profilePath,
  }""";
}

class TvLastEpisodeToAir extends TObject {
  final int id;
  final String name;
  final DateTime airDate;
  final int seasonNumber;
  final int episodeNumber;
  final String overview;
  final String productionCode;
  final int showId;
  final String stillPath;
  final double voteAverage;
  final int voteCount;

  TvLastEpisodeToAir({
    this.id,
    this.name,
    this.airDate,
    this.seasonNumber,
    this.episodeNumber,
    this.overview,
    this.productionCode,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  factory TvLastEpisodeToAir.fromJson(Map<String, dynamic> json) => TvLastEpisodeToAir(
        id: json['id'] as int,
        name: json['name'] as String,
        airDate: TConvertersHelper.dateTimeFromString(json['air_date'] as String),
        seasonNumber: json['season_number'] as int,
        episodeNumber: json['episode_number'] as int,
        overview: json['overview'] as String,
        productionCode: json['production_code'] as String,
        showId: json['show_id'] as int,
        stillPath: json['still_path'] as String,
        voteAverage: (json['vote_average'] as num)?.toDouble(),
        voteCount: json['vote_count'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'air_date': TConvertersHelper.dateTimeToString(airDate),
        'season_number': seasonNumber,
        'episode_number': episodeNumber,
        'overview': overview,
        'production_code': productionCode,
        'show_id': showId,
        'still_path': stillPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  String getStillUrl({TApiStillSize size}) => TApiHelper.buildStillUrl(stillPath, size);

  @override
  List<Object> get props => [
        id,
        name,
        airDate,
        seasonNumber,
        episodeNumber,
        overview,
        productionCode,
        showId,
        stillPath,
        voteAverage,
        voteCount,
      ];

  @override
  String toString() => """TvLastEpisodeToAir{
    id: $id,
    name: $name,
    airDate: $airDate,
    seasonNumber: $seasonNumber,
    episodeNumber: $episodeNumber,
    overview: $overview,
    productionCode: $productionCode,
    showId: $showId,
    stillPath: $stillPath,
    voteAverage: $voteAverage,
    voteCount: $voteCount,
  }""";
}

class TvNetwork extends TObject {
  final int id;
  final String name;
  final String originCountry;
  final String logoPath;

  TvNetwork({
    this.id,
    this.name,
    this.originCountry,
    this.logoPath,
  });

  factory TvNetwork.fromJson(Map<String, dynamic> json) => TvNetwork(
        id: json['id'] as int,
        name: json['name'] as String,
        originCountry: json['origin_country'] as String,
        logoPath: json['logo_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'origin_country': originCountry,
        'logo_path': logoPath,
      };

  String getLogoUrl({TApiLogoSize size}) => TApiHelper.buildLogoUrl(logoPath, size);

  @override
  List<Object> get props => [id, name, originCountry, logoPath];

  @override
  String toString() => """TvNetwork{
    id: $id,
    name: $name,
    originCountry: $originCountry,
    logoPath: $logoPath,
  }""";
}

class TvProductionCompany extends TObject {
  final int id;
  final String name;
  final String originCountry;
  final String logoPath;

  TvProductionCompany({
    this.id,
    this.name,
    this.originCountry,
    this.logoPath,
  });

  factory TvProductionCompany.fromJson(Map<String, dynamic> json) => TvProductionCompany(
        id: json['id'] as int,
        name: json['name'] as String,
        originCountry: json['origin_country'] as String,
        logoPath: json['logo_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'origin_country': originCountry,
        'logo_path': logoPath,
      };

  String getLogoUrl({TApiLogoSize size}) => TApiHelper.buildLogoUrl(logoPath, size);

  @override
  List<Object> get props => [id, name, originCountry, logoPath];

  @override
  String toString() => """TvProductionCompany{
    id: $id,
    name: $name,
    originCountry: $originCountry,
    logoPath: $logoPath,
  }""";
}

class TvSeasonResumed extends TObject {
  final int id;
  final String name;
  final DateTime airDate;
  final int seasonNumber;
  final int episodeCount;
  final String overview;
  final String posterPath;

  TvSeasonResumed({
    this.id,
    this.name,
    this.airDate,
    this.seasonNumber,
    this.episodeCount,
    this.overview,
    this.posterPath,
  });

  factory TvSeasonResumed.fromJson(Map<String, dynamic> json) => TvSeasonResumed(
        id: json['id'] as int,
        name: json['name'] as String,
        airDate: TConvertersHelper.dateTimeFromString(json['air_date'] as String),
        seasonNumber: json['season_number'] as int,
        episodeCount: json['episode_count'] as int,
        overview: json['overview'] as String,
        posterPath: json['poster_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'air_date': TConvertersHelper.dateTimeToString(airDate),
        'season_number': seasonNumber,
        'episode_count': episodeCount,
        'overview': overview,
        'poster_path': posterPath,
      };

  String getPosterUrl({TApiPosterSize size}) => TApiHelper.buildPosterUrl(posterPath, size);

  @override
  List<Object> get props => [
        id,
        name,
        airDate,
        seasonNumber,
        episodeCount,
        overview,
        posterPath,
      ];

  @override
  String toString() => """TvSeasonResumed{
    id: $id,
    name: $name,
    airDate: $airDate,
    seasonNumber: $seasonNumber,
    episodeCount: $episodeCount,
    overview: $overview,
    posterPath: $posterPath,
  }""";
}
