// Mocks generated by Mockito 5.4.0 from annotations
// in cinebuy_app/test/model/api/movies_api_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:cinebuy_app/model/api/movies_api.dart' as _i3;
import 'package:cinebuy_app/model/movies_model.dart' as _i4;
import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MoviesApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesApi extends _i1.Mock implements _i3.MoviesApi {
  MockMoviesApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);
  @override
  List<_i4.MovieModel> get movies => (super.noSuchMethod(
        Invocation.getter(#movies),
        returnValue: <_i4.MovieModel>[],
      ) as List<_i4.MovieModel>);
  @override
  set movies(List<_i4.MovieModel>? _movies) => super.noSuchMethod(
        Invocation.setter(
          #movies,
          _movies,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i4.MovieModel> get latestMovies => (super.noSuchMethod(
        Invocation.getter(#latestMovies),
        returnValue: <_i4.MovieModel>[],
      ) as List<_i4.MovieModel>);
  @override
  set latestMovies(List<_i4.MovieModel>? _latestMovies) => super.noSuchMethod(
        Invocation.setter(
          #latestMovies,
          _latestMovies,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<dynamic> fetchTrendingMovies() => (super.noSuchMethod(
        Invocation.method(
          #fetchTrendingMovies,
          [],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> fetchLatestMovies() => (super.noSuchMethod(
        Invocation.method(
          #fetchLatestMovies,
          [],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> fetchSearchMovies(String? query) => (super.noSuchMethod(
        Invocation.method(
          #fetchSearchMovies,
          [query],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
}
