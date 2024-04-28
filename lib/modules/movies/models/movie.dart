import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/modules/movies/movies.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String title,
    required String year,
    required String rated,
    required String released,
    required String runtime,
    required List<String> genre,
    required String director,
    required String writer,
    required List<String> actors,
    required String plot,
    required List<String> language,
    required List<String> country,
    required String awards,
    required String poster,
    @JsonKey(name: 'Ratings') required List<Rating> ratings,
    required String metascore,
    required String imdbRating,
    required String imdbVotes,
    required String imdbID,
    required String type,
    required String dvd,
    required String boxOffice,
    required String production,
    required String website,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
