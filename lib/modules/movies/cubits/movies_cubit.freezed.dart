// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoviesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function(List<Movie> movies) loaded,
    required TResult Function(String? search) searching,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingMore,
    TResult? Function(List<Movie> movies)? loaded,
    TResult? Function(String? search)? searching,
    TResult? Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function(List<Movie> movies)? loaded,
    TResult Function(String? search)? searching,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoviesInitial value) initial,
    required TResult Function(MoviesLoading value) loading,
    required TResult Function(MoviesLoadingMore value) loadingMore,
    required TResult Function(MoviesLoaded value) loaded,
    required TResult Function(MoviesSearching value) searching,
    required TResult Function(MoviesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoviesInitial value)? initial,
    TResult? Function(MoviesLoading value)? loading,
    TResult? Function(MoviesLoadingMore value)? loadingMore,
    TResult? Function(MoviesLoaded value)? loaded,
    TResult? Function(MoviesSearching value)? searching,
    TResult? Function(MoviesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoviesInitial value)? initial,
    TResult Function(MoviesLoading value)? loading,
    TResult Function(MoviesLoadingMore value)? loadingMore,
    TResult Function(MoviesLoaded value)? loaded,
    TResult Function(MoviesSearching value)? searching,
    TResult Function(MoviesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesStateCopyWith<$Res> {
  factory $MoviesStateCopyWith(
          MoviesState value, $Res Function(MoviesState) then) =
      _$MoviesStateCopyWithImpl<$Res, MoviesState>;
}

/// @nodoc
class _$MoviesStateCopyWithImpl<$Res, $Val extends MoviesState>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MoviesInitialImplCopyWith<$Res> {
  factory _$$MoviesInitialImplCopyWith(
          _$MoviesInitialImpl value, $Res Function(_$MoviesInitialImpl) then) =
      __$$MoviesInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MoviesInitialImplCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$MoviesInitialImpl>
    implements _$$MoviesInitialImplCopyWith<$Res> {
  __$$MoviesInitialImplCopyWithImpl(
      _$MoviesInitialImpl _value, $Res Function(_$MoviesInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MoviesInitialImpl implements MoviesInitial {
  const _$MoviesInitialImpl();

  @override
  String toString() {
    return 'MoviesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MoviesInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function(List<Movie> movies) loaded,
    required TResult Function(String? search) searching,
    required TResult Function(Failure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingMore,
    TResult? Function(List<Movie> movies)? loaded,
    TResult? Function(String? search)? searching,
    TResult? Function(Failure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function(List<Movie> movies)? loaded,
    TResult Function(String? search)? searching,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoviesInitial value) initial,
    required TResult Function(MoviesLoading value) loading,
    required TResult Function(MoviesLoadingMore value) loadingMore,
    required TResult Function(MoviesLoaded value) loaded,
    required TResult Function(MoviesSearching value) searching,
    required TResult Function(MoviesFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoviesInitial value)? initial,
    TResult? Function(MoviesLoading value)? loading,
    TResult? Function(MoviesLoadingMore value)? loadingMore,
    TResult? Function(MoviesLoaded value)? loaded,
    TResult? Function(MoviesSearching value)? searching,
    TResult? Function(MoviesFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoviesInitial value)? initial,
    TResult Function(MoviesLoading value)? loading,
    TResult Function(MoviesLoadingMore value)? loadingMore,
    TResult Function(MoviesLoaded value)? loaded,
    TResult Function(MoviesSearching value)? searching,
    TResult Function(MoviesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MoviesInitial implements MoviesState {
  const factory MoviesInitial() = _$MoviesInitialImpl;
}

/// @nodoc
abstract class _$$MoviesLoadingImplCopyWith<$Res> {
  factory _$$MoviesLoadingImplCopyWith(
          _$MoviesLoadingImpl value, $Res Function(_$MoviesLoadingImpl) then) =
      __$$MoviesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MoviesLoadingImplCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$MoviesLoadingImpl>
    implements _$$MoviesLoadingImplCopyWith<$Res> {
  __$$MoviesLoadingImplCopyWithImpl(
      _$MoviesLoadingImpl _value, $Res Function(_$MoviesLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MoviesLoadingImpl implements MoviesLoading {
  const _$MoviesLoadingImpl();

  @override
  String toString() {
    return 'MoviesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MoviesLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function(List<Movie> movies) loaded,
    required TResult Function(String? search) searching,
    required TResult Function(Failure failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingMore,
    TResult? Function(List<Movie> movies)? loaded,
    TResult? Function(String? search)? searching,
    TResult? Function(Failure failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function(List<Movie> movies)? loaded,
    TResult Function(String? search)? searching,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoviesInitial value) initial,
    required TResult Function(MoviesLoading value) loading,
    required TResult Function(MoviesLoadingMore value) loadingMore,
    required TResult Function(MoviesLoaded value) loaded,
    required TResult Function(MoviesSearching value) searching,
    required TResult Function(MoviesFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoviesInitial value)? initial,
    TResult? Function(MoviesLoading value)? loading,
    TResult? Function(MoviesLoadingMore value)? loadingMore,
    TResult? Function(MoviesLoaded value)? loaded,
    TResult? Function(MoviesSearching value)? searching,
    TResult? Function(MoviesFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoviesInitial value)? initial,
    TResult Function(MoviesLoading value)? loading,
    TResult Function(MoviesLoadingMore value)? loadingMore,
    TResult Function(MoviesLoaded value)? loaded,
    TResult Function(MoviesSearching value)? searching,
    TResult Function(MoviesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MoviesLoading implements MoviesState {
  const factory MoviesLoading() = _$MoviesLoadingImpl;
}

/// @nodoc
abstract class _$$MoviesLoadingMoreImplCopyWith<$Res> {
  factory _$$MoviesLoadingMoreImplCopyWith(_$MoviesLoadingMoreImpl value,
          $Res Function(_$MoviesLoadingMoreImpl) then) =
      __$$MoviesLoadingMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MoviesLoadingMoreImplCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$MoviesLoadingMoreImpl>
    implements _$$MoviesLoadingMoreImplCopyWith<$Res> {
  __$$MoviesLoadingMoreImplCopyWithImpl(_$MoviesLoadingMoreImpl _value,
      $Res Function(_$MoviesLoadingMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MoviesLoadingMoreImpl implements MoviesLoadingMore {
  const _$MoviesLoadingMoreImpl();

  @override
  String toString() {
    return 'MoviesState.loadingMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MoviesLoadingMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function(List<Movie> movies) loaded,
    required TResult Function(String? search) searching,
    required TResult Function(Failure failure) failure,
  }) {
    return loadingMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingMore,
    TResult? Function(List<Movie> movies)? loaded,
    TResult? Function(String? search)? searching,
    TResult? Function(Failure failure)? failure,
  }) {
    return loadingMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function(List<Movie> movies)? loaded,
    TResult Function(String? search)? searching,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoviesInitial value) initial,
    required TResult Function(MoviesLoading value) loading,
    required TResult Function(MoviesLoadingMore value) loadingMore,
    required TResult Function(MoviesLoaded value) loaded,
    required TResult Function(MoviesSearching value) searching,
    required TResult Function(MoviesFailure value) failure,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoviesInitial value)? initial,
    TResult? Function(MoviesLoading value)? loading,
    TResult? Function(MoviesLoadingMore value)? loadingMore,
    TResult? Function(MoviesLoaded value)? loaded,
    TResult? Function(MoviesSearching value)? searching,
    TResult? Function(MoviesFailure value)? failure,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoviesInitial value)? initial,
    TResult Function(MoviesLoading value)? loading,
    TResult Function(MoviesLoadingMore value)? loadingMore,
    TResult Function(MoviesLoaded value)? loaded,
    TResult Function(MoviesSearching value)? searching,
    TResult Function(MoviesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class MoviesLoadingMore implements MoviesState {
  const factory MoviesLoadingMore() = _$MoviesLoadingMoreImpl;
}

/// @nodoc
abstract class _$$MoviesLoadedImplCopyWith<$Res> {
  factory _$$MoviesLoadedImplCopyWith(
          _$MoviesLoadedImpl value, $Res Function(_$MoviesLoadedImpl) then) =
      __$$MoviesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Movie> movies});
}

/// @nodoc
class __$$MoviesLoadedImplCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$MoviesLoadedImpl>
    implements _$$MoviesLoadedImplCopyWith<$Res> {
  __$$MoviesLoadedImplCopyWithImpl(
      _$MoviesLoadedImpl _value, $Res Function(_$MoviesLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
  }) {
    return _then(_$MoviesLoadedImpl(
      null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$MoviesLoadedImpl implements MoviesLoaded {
  const _$MoviesLoadedImpl(final List<Movie> movies) : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  String toString() {
    return 'MoviesState.loaded(movies: $movies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesLoadedImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_movies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesLoadedImplCopyWith<_$MoviesLoadedImpl> get copyWith =>
      __$$MoviesLoadedImplCopyWithImpl<_$MoviesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function(List<Movie> movies) loaded,
    required TResult Function(String? search) searching,
    required TResult Function(Failure failure) failure,
  }) {
    return loaded(movies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingMore,
    TResult? Function(List<Movie> movies)? loaded,
    TResult? Function(String? search)? searching,
    TResult? Function(Failure failure)? failure,
  }) {
    return loaded?.call(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function(List<Movie> movies)? loaded,
    TResult Function(String? search)? searching,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoviesInitial value) initial,
    required TResult Function(MoviesLoading value) loading,
    required TResult Function(MoviesLoadingMore value) loadingMore,
    required TResult Function(MoviesLoaded value) loaded,
    required TResult Function(MoviesSearching value) searching,
    required TResult Function(MoviesFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoviesInitial value)? initial,
    TResult? Function(MoviesLoading value)? loading,
    TResult? Function(MoviesLoadingMore value)? loadingMore,
    TResult? Function(MoviesLoaded value)? loaded,
    TResult? Function(MoviesSearching value)? searching,
    TResult? Function(MoviesFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoviesInitial value)? initial,
    TResult Function(MoviesLoading value)? loading,
    TResult Function(MoviesLoadingMore value)? loadingMore,
    TResult Function(MoviesLoaded value)? loaded,
    TResult Function(MoviesSearching value)? searching,
    TResult Function(MoviesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MoviesLoaded implements MoviesState {
  const factory MoviesLoaded(final List<Movie> movies) = _$MoviesLoadedImpl;

  List<Movie> get movies;
  @JsonKey(ignore: true)
  _$$MoviesLoadedImplCopyWith<_$MoviesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MoviesSearchingImplCopyWith<$Res> {
  factory _$$MoviesSearchingImplCopyWith(_$MoviesSearchingImpl value,
          $Res Function(_$MoviesSearchingImpl) then) =
      __$$MoviesSearchingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class __$$MoviesSearchingImplCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$MoviesSearchingImpl>
    implements _$$MoviesSearchingImplCopyWith<$Res> {
  __$$MoviesSearchingImplCopyWithImpl(
      _$MoviesSearchingImpl _value, $Res Function(_$MoviesSearchingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$MoviesSearchingImpl(
      freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MoviesSearchingImpl implements MoviesSearching {
  const _$MoviesSearchingImpl(this.search);

  @override
  final String? search;

  @override
  String toString() {
    return 'MoviesState.searching(search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesSearchingImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesSearchingImplCopyWith<_$MoviesSearchingImpl> get copyWith =>
      __$$MoviesSearchingImplCopyWithImpl<_$MoviesSearchingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function(List<Movie> movies) loaded,
    required TResult Function(String? search) searching,
    required TResult Function(Failure failure) failure,
  }) {
    return searching(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingMore,
    TResult? Function(List<Movie> movies)? loaded,
    TResult? Function(String? search)? searching,
    TResult? Function(Failure failure)? failure,
  }) {
    return searching?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function(List<Movie> movies)? loaded,
    TResult Function(String? search)? searching,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoviesInitial value) initial,
    required TResult Function(MoviesLoading value) loading,
    required TResult Function(MoviesLoadingMore value) loadingMore,
    required TResult Function(MoviesLoaded value) loaded,
    required TResult Function(MoviesSearching value) searching,
    required TResult Function(MoviesFailure value) failure,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoviesInitial value)? initial,
    TResult? Function(MoviesLoading value)? loading,
    TResult? Function(MoviesLoadingMore value)? loadingMore,
    TResult? Function(MoviesLoaded value)? loaded,
    TResult? Function(MoviesSearching value)? searching,
    TResult? Function(MoviesFailure value)? failure,
  }) {
    return searching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoviesInitial value)? initial,
    TResult Function(MoviesLoading value)? loading,
    TResult Function(MoviesLoadingMore value)? loadingMore,
    TResult Function(MoviesLoaded value)? loaded,
    TResult Function(MoviesSearching value)? searching,
    TResult Function(MoviesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class MoviesSearching implements MoviesState {
  const factory MoviesSearching(final String? search) = _$MoviesSearchingImpl;

  String? get search;
  @JsonKey(ignore: true)
  _$$MoviesSearchingImplCopyWith<_$MoviesSearchingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MoviesFailureImplCopyWith<$Res> {
  factory _$$MoviesFailureImplCopyWith(
          _$MoviesFailureImpl value, $Res Function(_$MoviesFailureImpl) then) =
      __$$MoviesFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$MoviesFailureImplCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$MoviesFailureImpl>
    implements _$$MoviesFailureImplCopyWith<$Res> {
  __$$MoviesFailureImplCopyWithImpl(
      _$MoviesFailureImpl _value, $Res Function(_$MoviesFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$MoviesFailureImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$MoviesFailureImpl implements MoviesFailure {
  const _$MoviesFailureImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'MoviesState.failure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesFailureImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesFailureImplCopyWith<_$MoviesFailureImpl> get copyWith =>
      __$$MoviesFailureImplCopyWithImpl<_$MoviesFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function(List<Movie> movies) loaded,
    required TResult Function(String? search) searching,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingMore,
    TResult? Function(List<Movie> movies)? loaded,
    TResult? Function(String? search)? searching,
    TResult? Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function(List<Movie> movies)? loaded,
    TResult Function(String? search)? searching,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoviesInitial value) initial,
    required TResult Function(MoviesLoading value) loading,
    required TResult Function(MoviesLoadingMore value) loadingMore,
    required TResult Function(MoviesLoaded value) loaded,
    required TResult Function(MoviesSearching value) searching,
    required TResult Function(MoviesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoviesInitial value)? initial,
    TResult? Function(MoviesLoading value)? loading,
    TResult? Function(MoviesLoadingMore value)? loadingMore,
    TResult? Function(MoviesLoaded value)? loaded,
    TResult? Function(MoviesSearching value)? searching,
    TResult? Function(MoviesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoviesInitial value)? initial,
    TResult Function(MoviesLoading value)? loading,
    TResult Function(MoviesLoadingMore value)? loadingMore,
    TResult Function(MoviesLoaded value)? loaded,
    TResult Function(MoviesSearching value)? searching,
    TResult Function(MoviesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class MoviesFailure implements MoviesState {
  const factory MoviesFailure(final Failure failure) = _$MoviesFailureImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$MoviesFailureImplCopyWith<_$MoviesFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
