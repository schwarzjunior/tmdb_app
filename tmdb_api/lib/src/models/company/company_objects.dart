import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';

class CompanyParent extends TObject {
  final int id;
  final String name;
  final String logoPath;

  CompanyParent({
    this.id,
    this.name,
    this.logoPath,
  });

  factory CompanyParent.fromJson(Map<String, dynamic> json) => CompanyParent(
        id: json['id'] as int,
        name: json['name'] as String,
        logoPath: json['logo_path'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'logo_path': logoPath,
      };

  String getLogoUrl({TApiLogoSize size}) => TApiHelper.buildLogoUrl(logoPath, size);

  @override
  List<Object> get props => [id, name, logoPath];

  @override
  String toString() => """CompanyParent{
    id: $id,
    name: $name,
    logoPath: $logoPath,
  }""";
}
