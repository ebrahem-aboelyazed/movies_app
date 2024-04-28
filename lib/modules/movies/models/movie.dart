import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/modules/movies/movies.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
  const factory Movie({
    @Default('') String title,
    @Default('') String year,
    @Default('') String rated,
    @Default('') String released,
    @Default('') String runtime,
    @Default('') String genre,
    @Default('') String director,
    @Default('') String writer,
    @Default('') String actors,
    @Default('') String plot,
    @Default('') String language,
    @Default('') String country,
    @Default('') String awards,
    @Default('') String poster,
    @Default(<Rating>[]) List<Rating> ratings,
    @Default('') String metascore,
    @Default('') @JsonKey(name: 'imdbRating') String imdbRating,
    @Default('') @JsonKey(name: 'imdbVotes') String imdbVotes,
    @Default('') @JsonKey(name: 'imdbID') String imdbID,
    @Default('') String type,
    @Default('') String dvd,
    @Default('') String boxOffice,
    @Default('') String production,
    @Default('') String website,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
