import 'package:http/http.dart' as http;
import 'package:tmdb_api/src/api/controller/api_controller.dart';
import 'package:tmdb_api/src/models/tmdb_models.dart';

part 'api_tv_performers.dart';

class ApiTv extends _ApiTvPerformers {
  Future<Tv> tvDetails(int id) async {
    return await _performTvDetails(id);
  }

  Future<TvSeason> tvSeasonDetails(int tvId, int seasonNumber) async {
    return await _performTvSeasonDetails(tvId, seasonNumber);
  }

  Future<TvEpisode> tvEpisodeDetails(int tvId, int seasonNumber, int episodeNumber) async {
    return await _performTvEpisodeDetails(tvId, seasonNumber, episodeNumber);
  }
}
