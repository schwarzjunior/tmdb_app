import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/search/base/search_base.dart';
import 'package:tmdb_api/src/models/search/multi_search/multi_search_movie.dart';
import 'package:tmdb_api/src/models/search/multi_search/multi_search_person.dart';
import 'package:tmdb_api/src/models/search/multi_search/multi_search_tv.dart';

class SingleSearchPerson<T extends TMultiSearchMediaObject> extends TMediaObject {
  final String name;
  final bool adult;
  final num popularity;
  final String profilePath;
  final List<T> knownFor;

  SingleSearchPerson({
    int id,
    this.name,
    this.adult,
    this.popularity,
    this.profilePath,
    this.knownFor,
  }) : super(id);

  factory SingleSearchPerson.fromJson(Map<String, dynamic> json) => SingleSearchPerson(
        id: json['id'] as int,
        name: json['name'] as String,
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
          return e as T;
        })?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
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
        adult,
        popularity,
        profilePath,
        knownFor,
      ];

  @override
  String toString() => """SingleSearchPerson{
    id: $id,
    name: $name,
    adult: $adult,
    popularity: $popularity,
    profilePath: $profilePath,
    knownFor: $knownFor,
  }""";
}
