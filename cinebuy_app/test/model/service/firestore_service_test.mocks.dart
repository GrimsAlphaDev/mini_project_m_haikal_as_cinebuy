// Mocks generated by Mockito 5.4.0 from annotations
// in cinebuy_app/test/model/service/firestore_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:cinebuy_app/model/owned_movies_model.dart' as _i4;
import 'package:cinebuy_app/model/service/firestore_service.dart' as _i2;
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

/// A class which mocks [FirestoreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirestoreService extends _i1.Mock implements _i2.FirestoreService {
  MockFirestoreService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get successAddMovie => (super.noSuchMethod(
        Invocation.getter(#successAddMovie),
        returnValue: false,
      ) as bool);
  @override
  set successAddMovie(bool? _successAddMovie) => super.noSuchMethod(
        Invocation.setter(
          #successAddMovie,
          _successAddMovie,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<bool> saveMovie(_i4.OwnedMovieModel? movie) => (super.noSuchMethod(
        Invocation.method(
          #saveMovie,
          [movie],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> doesMovieExist(_i4.OwnedMovieModel? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #doesMovieExist,
          [movie],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Stream<List<_i4.OwnedMovieModel>> getMovies() => (super.noSuchMethod(
        Invocation.method(
          #getMovies,
          [],
        ),
        returnValue: _i3.Stream<List<_i4.OwnedMovieModel>>.empty(),
      ) as _i3.Stream<List<_i4.OwnedMovieModel>>);
  @override
  _i3.Future<void> removeMovie(String? ownedMovieId) => (super.noSuchMethod(
        Invocation.method(
          #removeMovie,
          [ownedMovieId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<List<_i4.OwnedMovieModel>> getMoviesByUser(String? userEmail) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMoviesByUser,
          [userEmail],
        ),
        returnValue: _i3.Future<List<_i4.OwnedMovieModel>>.value(
            <_i4.OwnedMovieModel>[]),
      ) as _i3.Future<List<_i4.OwnedMovieModel>>);
}
