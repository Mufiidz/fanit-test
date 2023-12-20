import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';
import 'data_result.dart';

abstract class FirebaseRepository {
  Future<BaseResult<User>> addUser(User user);
  Future<BaseResult<User>> getUser(String userId);
}

@Injectable(as: FirebaseRepository)
class FirebaseRepositoryImpl implements FirebaseRepository {
  static const String usersKey = 'users';
  final FirebaseFirestore _firestore;

  FirebaseRepositoryImpl(this._firestore);

  @override
  Future<BaseResult<User>> addUser(User user) async {
    try {
      await _firestore.collection(usersKey).doc(user.id).set(user.firestoreMap());
      return DataResult(user);
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }

  @override
  Future<BaseResult<User>> getUser(String userId) async {
    try {
      final rawData = await _firestore.collection(usersKey).doc(userId).get();
      final user = User.fromJson(rawData.data());
      return DataResult(user);
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }
}
