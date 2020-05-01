import 'package:http/http.dart' as http;
import 'package:tmdb_api/src/api/controller/api_controller.dart';
import 'package:tmdb_api/src/models/movie/movie.dart';

part 'api_movie_performers.dart';

class ApiMovie extends _ApiMoviePerformers {
  Future<Movie> movieDetails(int id) async {
    return _performMovieDetails(id);
  }
}
