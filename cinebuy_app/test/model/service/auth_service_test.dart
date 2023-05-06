import 'package:cinebuy_app/model/service/auth_service.dart';
import 'package:cinebuy_app/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_service_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  group('authService', () {
    AuthService authService = MockAuthService();

    test('Sign in with email and password', () async {
      when(authService.signInWithEmailAndPassword(
              email: 'user1@gmail.com', password: 'userpass', context: ''))
          .thenAnswer(
        (_) async => UserModel(
          uid: '1234567890',
          email: 'user1@gmail.com',
        ),
      );
      var result = await authService.signInWithEmailAndPassword(
          context: '', email: 'user1@gmail.com', password: 'userpass');
      expect(result, isNotNull);
      expect(result, isA<UserModel>());
    });

    test('Create Auth with email and password', () async {
      when(authService.createUserWithEmailAndPassword(
              email: 'user1@gmail.com', password: 'userpass', context: ''))
          .thenAnswer(
        (_) async => UserModel(
          uid: '1234567890',
          email: 'user1@gmail.com',
        ),
      );
      var result = await authService.createUserWithEmailAndPassword(
          context: '', email: 'user1@gmail.com', password: 'userpass');
      expect(result, isNotNull);
      expect(result, isA<UserModel>());
    });
  });
}
