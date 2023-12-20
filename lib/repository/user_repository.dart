import 'package:auth_test/data/data_result.dart';
import 'package:auth_test/data/firebase_repository.dart';
import 'package:auth_test/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart' as model;

abstract class UserRepository {
  Future<BaseResult<model.User>> getUser();
  Future<BaseResult<bool>> isEmailVerified();
  Future<BaseResult<String>> logout();
}

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final FirebaseRepository _firebaseRepository;
  final FirebaseAuth _auth;

  UserRepositoryImpl(this._firebaseRepository, this._auth);

  @override
  Future<BaseResult<model.User>> getUser() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return ErrorResult("User not logged in");
      }
      logger.d(currentUser.uid);
      return _firebaseRepository.getUser(currentUser.uid);
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }

  @override
  Future<BaseResult<bool>> isEmailVerified() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return ErrorResult("User not logged in");
      }
      return DataResult(currentUser.emailVerified);
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }

  @override
  Future<BaseResult<String>> logout() async {
    try {
      await _auth.signOut();
      return DataResult("You have been logged out");
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }
}
