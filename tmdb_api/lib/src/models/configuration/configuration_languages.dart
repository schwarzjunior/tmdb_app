import 'package:tmdb_api/src/models/base/base.dart';

class TConfigurationLanguages extends TObject {
  TConfigurationLanguages({this.languages});

  final List<TConfigurationLanguage> languages;

  factory TConfigurationLanguages.fromJson(Map<String, dynamic> json) => TConfigurationLanguages(
        languages: (json['languages'] as List)
            ?.map((e) =>
                e == null ? null : TConfigurationLanguage.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'languages': languages?.map((e) => e.toJson())?.toList(),
      };

  @override
  List<Object> get props => [languages];

  @override
  String toString() => """TConfigurationLanguages{
  languages: $languages,
  }""";
}

class TConfigurationLanguage extends TObject {
  TConfigurationLanguage({
    this.iso639_1,
    this.englishName,
    this.name,
  });

  final String iso639_1;
  final String englishName;
  final String name;

  factory TConfigurationLanguage.fromJson(Map<String, dynamic> json) => TConfigurationLanguage(
        iso639_1: json['iso_639_1'] as String,
        englishName: json['english_name'] as String,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'iso_639_1': iso639_1,
        'english_name': englishName,
        'name': name,
      };

  @override
  List<Object> get props => [iso639_1, englishName, name];

  @override
  String toString() => """TConfigurationLanguage{
  iso639_1: $iso639_1,
  englishName: $englishName,
  name: $name,
  }""";
}
