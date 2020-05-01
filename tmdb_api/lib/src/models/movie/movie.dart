import 'package:tmdb_api/src/helpers/tmdb_converters_helper.dart';
import 'package:tmdb_api/src/models/base/base.dart';
import 'package:tmdb_api/src/models/movie/movie_objects.dart';


class Movie extends TMediaObject {
  final String imdbId;
  final String title;
  final String overview;
  final String tagline;
  final DateTime releaseDate;
  final bool adult;
  final int budget;
  final int revenue;
  final int voteCount;
  final double voteAverage;
  final num popularity;
  final String status;
  final String homepage;
  final String posterPath;
  final String backdropPath;
  final List<MovieGenre> genres;
  final List<MovieLanguage> spokenLanguages;
  final MovieCredits credits;
  final List<MovieVideo> videos;

  Movie({
    int id,
    this.imdbId,
    this.title,
    this.overview,
    this.tagline,
    this.releaseDate,
    this.adult,
    this.budget,
    this.revenue,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.status,
    this.homepage,
    this.posterPath,
    this.backdropPath,
    this.genres,
    this.spokenLanguages,
    this.credits,
    this.videos,
  }) : super(id);

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] as int,
        imdbId: json['imdb_id'] as String,
        title: json['title'] as String,
        overview: json['overview'] as String,
        tagline: json['tagline'] as String,
        releaseDate: TConvertersHelper.dateTimeFromString(json['release_date'] as String),
        adult: json['adult'] as bool,
        budget: json['budget'] as int,
        revenue: json['revenue'] as int,
        voteCount: json['vote_count'] as int,
        voteAverage: json['vote_average'] as double,
        popularity: json['popularity'] as num,
        status: json['status'] as String,
        homepage: json['homepage'] as String,
        posterPath: json['poster_path'] as String,
        backdropPath: json['backdrop_path'] as String,
        genres: (json['genres'] as List)
            ?.map((e) => e == null ? null : MovieGenre.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        spokenLanguages: (json['spoken_languages'] as List)
            ?.map((e) => e == null ? null : MovieLanguage.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        credits: json['credits'] == null
            ? null
            : MovieCredits.fromJson(json['credits'] as Map<String, dynamic>),
        videos: json['videos'] == null
            ? null
            : (json['videos']['results'] as List)
                ?.map((e) => e == null ? null : MovieVideo.fromJson(e as Map<String, dynamic>))
                ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'imdb_id': imdbId,
        'title': title,
        'overview': overview,
        'tagline': tagline,
        'release_date': TConvertersHelper.dateTimeToString(releaseDate),
        'adult': adult,
        'budget': budget,
        'revenue': revenue,
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'popularity': popularity,
        'status': status,
        'homepage': homepage,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
        'genres': genres?.map((e) => e.toJson())?.toList(),
        'spoken_languages': spokenLanguages?.map((e) => e.toJson())?.toList(),
        'credits': credits?.toJson(),
        'videos': <String, dynamic>{
          'results': videos?.map((e) => e.toJson())?.toList(),
        },
      };

  @override
  List<Object> get props => [
        id,
        imdbId,
        title,
        overview,
        tagline,
        releaseDate,
        adult,
        budget,
        revenue,
        voteCount,
        voteAverage,
        popularity,
        status,
        homepage,
        posterPath,
        backdropPath,
        genres,
        spokenLanguages,
        credits,
        videos,
      ];

  @override
  String toString() => """Movie{
    id: $id,
    imdbId: $imdbId,
    title: $title,
    overview: $overview,
    tagline: $tagline,
    releaseDate: $releaseDate,
    adult: $adult,
    budget: $budget,
    revenue: $revenue,
    voteCount: $voteCount,
    voteAverage: $voteAverage,
    popularity: $popularity,
    status: $status,
    homepage: $homepage,
    posterPath: $posterPath,
    backdropPath: $backdropPath,
    genres: $genres,
    spokenLanguages: $spokenLanguages,
    credits: $credits,
    videos: $videos,
  }""";
}
