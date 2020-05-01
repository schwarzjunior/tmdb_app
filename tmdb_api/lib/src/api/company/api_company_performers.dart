part of 'api_company.dart';

abstract class _ApiCompanyPerformers {
  final TApiData _apiData = TApiController.apiData;

  Future<Company> _performCompanyDetails(int id) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/company/'
        '$id'
        '?api_key=${_apiData.apiKey}');
    return _decodeCompanyDetails(response);
  }

  Company _decodeCompanyDetails(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load company details.');
    return decoded == null ? null : Company.fromJson(decoded);
  }
}
