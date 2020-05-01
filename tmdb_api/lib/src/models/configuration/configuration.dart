import 'package:tmdb_api/src/models/base/base.dart';

class TConfiguration extends TObject {
  TConfiguration({
    this.images,
    this.changeKeys,
  });

  final TConfigurationImages images;
  final List<String> changeKeys;

  factory TConfiguration.fromJson(Map<String, dynamic> json) => TConfiguration(
        images: json['images'] == null
            ? null
            : TConfigurationImages.fromJson(json['images'] as Map<String, dynamic>),
        changeKeys: (json['change_keys'] as List)?.map((e) => e as String)?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'images': images.toJson(),
        'change_keys': changeKeys,
      };

  @override
  List<Object> get props => [images, changeKeys];

  @override
  String toString() => """TConfiguration{
  images: ${images.toString().split("\n").join("\n  ")},
  changeKeys: $changeKeys,
}""";
}

class TConfigurationImages extends TObject {
  final String baseUrl;
  final String secureBaseUrl;
  final List<String> posterSizes;
  final List<String> backdropSizes;
  final List<String> profileSizes;
  final List<String> stillSizes;
  final List<String> logoSizes;

  TConfigurationImages({
    this.baseUrl,
    this.secureBaseUrl,
    this.posterSizes,
    this.backdropSizes,
    this.profileSizes,
    this.stillSizes,
    this.logoSizes,
  });

  factory TConfigurationImages.fromJson(Map<String, dynamic> json) => TConfigurationImages(
        baseUrl: json['base_url'] as String,
        secureBaseUrl: json['secure_base_url'] as String,
        posterSizes: (json['poster_sizes'] as List)?.map((e) => e as String)?.toList(),
        backdropSizes: (json['backdrop_sizes'] as List)?.map((e) => e as String)?.toList(),
        profileSizes: (json['profile_sizes'] as List)?.map((e) => e as String)?.toList(),
        stillSizes: (json['still_sizes'] as List)?.map((e) => e as String)?.toList(),
        logoSizes: (json['logo_sizes'] as List)?.map((e) => e as String)?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'base_url': baseUrl,
        'secure_base_url': secureBaseUrl,
        'poster_sizes': posterSizes,
        'backdrop_sizes': backdropSizes,
        'profile_sizes': profileSizes,
        'still_sizes': stillSizes,
        'logo_sizes': logoSizes,
      };

  @override
  List<Object> get props => [
        baseUrl,
        secureBaseUrl,
        posterSizes,
        backdropSizes,
        profileSizes,
        stillSizes,
        logoSizes,
      ];

  @override
  String toString() => """TConfigurationImages{
  baseUrl: $baseUrl,
  secureBaseUrl: $secureBaseUrl,
  posterSizes: $posterSizes,
  backdropSizes: $backdropSizes,
  profileSizes: $profileSizes,
  stillSizes: $stillSizes,
  logoSizes: $logoSizes,
}""";
}
