import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/search/multi_search/multi_search_tv.dart';
import 'package:tmdb_api/src/models/tmdb_models.dart';

class MultiSearchPerson<T extends TMultiSearchMediaObject> extends TMultiSearchMediaObject {
  final int id;
  final String name;
  final TGender gender;
  final String knownForDepartment;
  final bool adult;
  final num popularity;
  final String profilePath;
  final List<T> knownFor;

  MultiSearchPerson({
    TMediaType mediaType,
    this.id,
    this.name,
    this.gender,
    this.knownForDepartment,
    this.adult,
    this.popularity,
    this.profilePath,
    this.knownFor,
  }) : super(mediaType);

  factory MultiSearchPerson.fromJson(Map<String, dynamic> json) => MultiSearchPerson(
        mediaType: TConvertersHelper.mediaTypeFromString(json['media_type'] as String),
        id: json['id'] as int,
        name: json['name'] as String,
        gender: TConvertersHelper.genderFromInt(json['gender'] as int),
        knownForDepartment: json['known_for_department'] as String,
        adult: json['adult'] as bool,
        popularity: json['popularity'] as num,
        profilePath: json['profile_path'] as String,
        knownFor: (json['known_for'] as List)?.map<T>((e) {
          if (e.containsKey('media_type')) {
            switch (e['media_type']) {
              case 'movie':
                return MultiSearchMovie.fromJson(e) as T;
              case 'tv':
                return MultiSearchTv.fromJson(e) as T;
              case 'person':
                return MultiSearchPerson.fromJson(e) as T;
            }
          }
          // FIXME: Se o 'media_type' for igual a other, resultara em um erro aqui!
          return e as T;
        })?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'media_type': TConvertersHelper.mediaTypeToString(mediaType),
        'id': id,
        'name': name,
        'gender': TConvertersHelper.genderToInt(gender),
        'known_for_department': knownForDepartment,
        'adult': adult,
        'popularity': popularity,
        'profile_path': profilePath,
        'known_for': knownFor?.map((e) => e.toJson())?.toList(),
      };

  String getProfileUrl({TApiProfileSize size}) => TApiHelper.buildProfileUrl(profilePath, size);

  @override
  List<Object> get props => [
        id,
        name,
        gender,
        knownForDepartment,
        adult,
        popularity,
        profilePath,
        knownFor,
        mediaType,
      ];

  @override
  String toString() => """MultiSearchPerson{
    mediaType: $mediaType,
    id: $id,
    name: $name,
    gender: $gender,
    knownForDepartment: $knownForDepartment,
    adult: $adult,
    popularity: $popularity,
    profilePath: $profilePath,
    knownFor: $knownFor,
  }""";
}
