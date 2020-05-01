part of 'api_movie.dart';

abstract class _ApiMoviePerformers extends TApiControllerBase {
  final TApiData _apiData = TApiController.apiData;

  Future<Movie> _performMovieDetails(int id) async {
    http.Response response = await http.get('https://api.themoviedb.org/3/movie/'
        '${id.toString()}'
        '?api_key=${_apiData.apiKey}'
        '&language=${_apiData.language.language}'
        '&append_to_response=videos,credits');
    return _decodeMovieDetails(response);
  }

  Movie _decodeMovieDetails(http.Response response) {
    final decoded = checkThenDecode(response, 'Failed to load movie details.');
    return decoded == null ? null : Movie.fromJson(decoded);
  }
}
