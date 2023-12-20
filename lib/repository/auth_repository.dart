import 'package:auth_test/data/data_result.dart';
import 'package:auth_test/data/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:injectable/injectable.dart';

import '../models/user.dart';

abstract class AuthRepository {
  Future<BaseResult<User>> register(User user);
  Future<BaseResult<auth.UserCredential>> login(String email, String password);
  Future<BaseResult<void>> resetPassword(String email);
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final FirebaseRepository _firebaseRepository;

  AuthRepositoryImpl(this._firebaseRepository, this._firebaseAuth);

  @override
  Future<BaseResult<auth.UserCredential>> login(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      credential.user?.emailVerified ?? false
          ? null
          : await credential.user?.sendEmailVerification();
      return DataResult(credential);
    } on auth.FirebaseAuthException catch (e) {
      var result = ErrorResult<auth.UserCredential>('');
      if (e.code == 'user-not-found') {
        result = ErrorResult('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        result = ErrorResult('Wrong password provided for that user.');
      }
      return result;
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }

  @override
  Future<BaseResult<User>> register(User user) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      await credential.user?.sendEmailVerification();
      final registeredUser = credential.user;
      if (registeredUser == null) {
        return ErrorResult('User not registered');
      }
      user = user.copyWith(id: registeredUser.uid);
      return await _firebaseRepository.addUser(user);
    } on auth.FirebaseAuthException catch (e) {
      var result = ErrorResult<User>('');
      if (e.code == 'weak-password') {
        result = ErrorResult('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        result = ErrorResult('The account already exists for that email.');
      }
      return result;
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }

  @override
  Future<BaseResult<void>> resetPassword(String email) async {
    try {
      final result = await _firebaseAuth.sendPasswordResetEmail(email: email);
      return DataResult(result);
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }
}
