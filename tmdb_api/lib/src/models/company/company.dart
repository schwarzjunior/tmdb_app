import 'package:tmdb_api/src/api/configuration/api_configuration_constants.dart';
import 'package:tmdb_api/src/helpers/tmdb_api_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/company/company_objects.dart';

class Company extends TObject {
  final int id;
  final String name;
  final String description;
  final String homepage;
  final String headquarters;
  final String originCountry;
  final String logoPath;
  final CompanyParent parentCompany;

  Company({
    this.id,
    this.name,
    this.description,
    this.homepage,
    this.headquarters,
    this.originCountry,
    this.logoPath,
    this.parentCompany,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        homepage: json['homepage'] as String,
        headquarters: json['headquarters'] as String,
        originCountry: json['origin_country'] as String,
        logoPath: json['logo_path'] as String,
        parentCompany: json['parent_company'] == null
            ? null
            : CompanyParent.fromJson(json['parent_company'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'homepage': homepage,
        'headquarters': headquarters,
        'origin_country': originCountry,
        'logo_path': logoPath,
        'parent_company': parentCompany.toJson(),
      };

  String getLogoUrl({TApiLogoSize size}) => TApiHelper.buildLogoUrl(logoPath, size);

  @override
  List<Object> get props => [
        id,
        name,
        description,
        homepage,
        headquarters,
        originCountry,
        logoPath,
        parentCompany,
      ];

  @override
  String toString() => """Company{
    id: $id,
    name: $name,
    description: $description,
    homepage: $homepage,
    headquarters: $headquarters,
    originCountry: $originCountry,
    logoPath: $logoPath,
    parentCompany: $parentCompany,
  }""";
}
