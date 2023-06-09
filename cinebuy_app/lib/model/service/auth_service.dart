import 'package:cinebuy_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  late String email;

  String getUserLoggegIn() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      email = user.email!;
      return email;
    }
    return 'Tidak ada user yang login';
  }

  UserModel? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(uid: user.uid, email: user.email);
  }

  Stream<UserModel?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserModel?> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required context}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Login Berhasil',
      );
      email = credential.user!.email!;
      return _userFromFirebase(credential.user);
    } catch (e) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Login Gagal',
        text: 'Email atau password yang anda masukkan salah',
      );
    }
    return null;
  }

  Future<UserModel?> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required context}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.popUntil(context, (route) => route.isFirst);
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Registrasi Berhasil',
      );
      return _userFromFirebase(credential.user);
    } catch (e) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Registrasi Gagal',
        text: 'Email atau password invalid atau sudah terdaftar',
      );
    }
    return null;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    
  }
}
