import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import '../../domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword(
      String email, String password, context);
  Future<Either<Failuer, UserEntity>> signInWithGoogle();
  Future addUserData({required UserEntity userEntity});
  Future<bool> searchUser({required String path, required String uid});
  Future<UserEntity> getUserData({required String path, required String uid});
  Future saveData({required UserEntity userEntity});
  Future deleteData();
  Future<Either<Failuer, UserEntity>> signInWithFacebook();
}
