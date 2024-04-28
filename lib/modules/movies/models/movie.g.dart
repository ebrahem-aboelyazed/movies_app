// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      title: json['title'] as String,
      year: json['year'] as String,
      rated: json['rated'] as String,
      released: json['released'] as String,
      runtime: json['runtime'] as String,
      genre: (json['genre'] as List<dynamic>).map((e) => e as String).toList(),
      director: json['director'] as String,
      writer: json['writer'] as String,
      actors:
          (json['actors'] as List<dynamic>).map((e) => e as String).toList(),
      plot: json['plot'] as String,
      language:
          (json['language'] as List<dynamic>).map((e) => e as String).toList(),
      country:
          (json['country'] as List<dynamic>).map((e) => e as String).toList(),
      awards: json['awards'] as String,
      poster: json['poster'] as String,
      ratings: (json['Ratings'] as List<dynamic>)
          .map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      metascore: json['metascore'] as String,
      imdbRating: json['imdbRating'] as String,
      imdbVotes: json['imdbVotes'] as String,
      imdbID: json['imdbID'] as String,
      type: json['type'] as String,
      dvd: json['dvd'] as String,
      boxOffice: json['boxOffice'] as String,
      production: json['production'] as String,
      website: json['website'] as String,
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'rated': instance.rated,
      'released': instance.released,
      'runtime': instance.runtime,
      'genre': instance.genre,
      'director': instance.director,
      'writer': instance.writer,
      'actors': instance.actors,
      'plot': instance.plot,
      'language': instance.language,
      'country': instance.country,
      'awards': instance.awards,
      'poster': instance.poster,
      'Ratings': instance.ratings,
      'metascore': instance.metascore,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'imdbID': instance.imdbID,
      'type': instance.type,
      'dvd': instance.dvd,
      'boxOffice': instance.boxOffice,
      'production': instance.production,
      'website': instance.website,
    };
