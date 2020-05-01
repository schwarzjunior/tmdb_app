import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';

class TvEpisodeGuestStar extends TObject {
  final int id;
  final String creditId;
  final String name;
  final String character;
  final int order;
  final String profilePath;

  TvEpisodeGuestStar({
    this.id,
    this.creditId,
    this.name,
    this.character,
    this.order,
    this.profilePath,
  });

  factory TvEpisodeGuestStar.fromJson(Map<String, dynamic> json) => TvEpisodeGuestStar(
        id: json['id'] as int,
        creditId: json['credit_id'] as String,
        name: json['name'] as String,
        character: json['character'] as String,
        order: json['order'] as int,
        profilePath: json['profile_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'credit_id': creditId,
        'name': name,
        'character': character,
        'order': order,
        'profile_path': profilePath,
      };

  String getProfileUrl({TApiProfileSize size}) => TApiHelper.buildProfileUrl(profilePath, size);

  @override
  List<Object> get props => [id, creditId, name, character, order, profilePath];

  @override
  String toString() => """TvEpisodeGuestStar{
    id: $id,
    creditId: $creditId,
    name: $name,
    character: $character,
    order: $order,
    profilePath: $profilePath,
  }""";
}

class TvEpisodeCrew extends TObject {
  final int id;
  final String creditId;
  final String name;
  final String department;
  final String job;
  final String profilePath;

  TvEpisodeCrew({
    this.id,
    this.creditId,
    this.name,
    this.department,
    this.job,
    this.profilePath,
  });

  factory TvEpisodeCrew.fromJson(Map<String, dynamic> json) => TvEpisodeCrew(
        id: json['id'] as int,
        creditId: json['credit_id'] as String,
        name: json['name'] as String,
        department: json['department'] as String,
        job: json['job'] as String,
        profilePath: json['profile_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'credit_id': creditId,
        'name': name,
        'department': department,
        'job': job,
        'profile_path': profilePath,
      };

  String getProfileUrl({TApiProfileSize size}) => TApiHelper.buildProfileUrl(profilePath, size);

  @override
  List<Object> get props => [id, creditId, name, department, job, profilePath];

  @override
  String toString() => """TvEpisodeCrew{
    id: $id,
    creditId: $creditId,
    name: $name,
    department: $department,
    job: $job,
    profilePath: $profilePath,
  }""";
}
