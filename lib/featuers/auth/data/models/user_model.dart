import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/featuers/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.uid,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      email: user.email ?? ' ',
      name: user.displayName ?? ' ',
      uid: user.uid,
    );
  }
  factory UserModel.fromFireStore(Map<String, dynamic> doc) {
    return UserModel(
      email: doc['email'],
      name: doc['name'],
      uid: doc['uid'],
    );
  }
}
