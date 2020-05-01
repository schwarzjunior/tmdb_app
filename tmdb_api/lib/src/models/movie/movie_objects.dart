import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';

class MovieVideosList extends TObject {
  final List<MovieVideo> videos;

  MovieVideosList({this.videos});

  factory MovieVideosList.fromJson(Map<String, dynamic> json) => MovieVideosList(
        videos: (json['results'] as List)
            ?.map((e) => e == null ? null : MovieVideo.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'results': videos,
      };

  @override
  List<Object> get props => [videos];

  @override
  String toString() => """MovieVideosList{
    videos: $videos,
  }""";
}

class MovieVideo extends TObject {
  final String id;
  final String name;
  final String key;
  final String site;
  final String type;
  final int size;

  MovieVideo({this.id, this.name, this.key, this.site, this.type, this.size});

  factory MovieVideo.fromJson(Map<String, dynamic> json) => MovieVideo(
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
  String toString() => """MovieVideo{
    id: $id,
    name: $name,
    key: $key,
    site: $site,
    type: $type,
    size: $size,
  }""";
}

class MovieCredits extends TObject {
  final List<MovieCast> cast;
  final List<MovieCrew> crew;

  MovieCredits({this.cast, this.crew});

  factory MovieCredits.fromJson(Map<String, dynamic> json) => MovieCredits(
        cast: (json['cast'] as List)
            ?.map((e) => e == null ? null : MovieCast.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        crew: (json['crew'] as List)
            ?.map((e) => e == null ? null : MovieCrew.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cast': cast?.map((e) => e.toJson())?.toList(),
        'crew': crew?.map((e) => e.toJson())?.toList(),
      };

  @override
  List<Object> get props => [cast, crew];

  @override
  String toString() => """MovieCredits{
    case: $cast,
    crew: $crew,
  }""";
}

class MovieCast extends TObject {
  final int id;
  final String creditId;
  final int castId;
  final String name;
  final String character;
  final TGender gender;
  final int order;
  final String profilePath;

  MovieCast({
    this.id,
    this.creditId,
    this.castId,
    this.name,
    this.character,
    this.gender,
    this.order,
    this.profilePath,
  });

  factory MovieCast.fromJson(Map<String, dynamic> json) => MovieCast(
        id: json['id'] as int,
        creditId: json['credit_id'] as String,
        castId: json['cast_id'] as int,
        name: json['name'] as String,
        character: json['character'] as String,
        gender: TConvertersHelper.genderFromInt(json['gender'] as int),
        order: json['order'] as int,
        profilePath: json['profile_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'credit_id': creditId,
        'cast_id': castId,
        'name': name,
        'character': character,
        'gender': TConvertersHelper.genderToInt(gender),
        'order': order,
        'profile_path': profilePath,
      };

  String getProfileUrl([TApiProfileSize size]) => TApiHelper.buildProfileUrl(profilePath, size);

  @override
  List<Object> get props => [
        id,
        creditId,
        castId,
        name,
        character,
        gender,
        order,
        profilePath,
      ];

  @override
  String toString() => """MovieCast{
    id: $id,
    creditId: $creditId,
    castId: $castId,
    name: $name,
    character: $character,
    gender: $gender,
    order: $order,
    profilePath: $profilePath,
  }""";
}

class MovieCrew extends TObject {
  final int id;
  final String creditId;
  final String name;
  final TGender gender;
  final String department;
  final String profilePath;

  MovieCrew({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.department,
    this.profilePath,
  });

  factory MovieCrew.fromJson(Map<String, dynamic> json) => MovieCrew(
        id: json['id'] as int,
        creditId: json['credit_id'] as String,
        name: json['name'] as String,
        gender: TConvertersHelper.genderFromInt(json['gender'] as int),
        department: json['department'] as String,
        profilePath: json['profile_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'credit_id': creditId,
        'name': name,
        'gender': TConvertersHelper.genderToInt(gender),
        'department': department,
        'profile_path': profilePath,
      };

  String getProfileUrl([TApiProfileSize size]) => TApiHelper.buildProfileUrl(profilePath, size);

  @override
  List<Object> get props => [id, creditId, name, gender, department, profilePath];

  @override
  String toString() => """MovieCrew{
    id: $id,
    creditId: $creditId,
    name: $name,
    gender: $gender,
    department: $department,
    profilePath: $profilePath,
  }""";
}

class MovieGenre extends TObject {
  final int id;
  final String name;

  MovieGenre({this.id, this.name});

  factory MovieGenre.fromJson(Map<String, dynamic> json) => MovieGenre(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };

  @override
  List<Object> get props => [id, name];

  @override
  String toString() => """MovieGenre{
    id: $id,
    name: $name,
  }""";
}

class MovieLanguage extends TObject {
  final String code;
  final String name;

  MovieLanguage({this.code, this.name});

  factory MovieLanguage.fromJson(Map<String, dynamic> json) => MovieLanguage(
        code: json['iso_639_1'] as String,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'iso_639_1': code,
        'name': name,
      };

  @override
  List<Object> get props => [code, name];

  @override
  String toString() => """MovieLanguage{
    code: $code,
    name: $name,
  }""";
}
