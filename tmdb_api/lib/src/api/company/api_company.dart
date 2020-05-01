import 'package:http/http.dart' as http;
import 'package:tmdb_api/src/api/controller/api_controller.dart';
import 'package:tmdb_api/src/models/company/company.dart';

part 'api_company_performers.dart';

class ApiCompany extends _ApiCompanyPerformers {
  Future<Company> companyDetails(int id) async {
    return _performCompanyDetails(id);
  }
}
