import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/db/cached_helper.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/service/dataBase_services.dart';
import 'package:fruits_app/core/service/fire_base_services.dart';
import 'package:fruits_app/featuers/auth/data/models/user_model.dart';
import 'package:fruits_app/featuers/auth/domain/repos/auth_repo.dart';
import '../../domain/entites/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseServices fireBaseServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl(
      {required this.fireBaseServices, required this.databaseServices});

  @override
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await fireBaseServices.createUserWithEmailAndPassword(
          email: email, password: password, name: name);

      await addUserData(userEntity: UserModel.fromFirebase(user));

      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      if (user != null) {
        await fireBaseServices.deleteAccount();
      }
      return left(Failuer(message: e.message));
    } catch (e) {
      if (user != null) {
        await fireBaseServices.deleteAccount();
      }
      return left(Failuer(message: 'حدث خطأ غير متوقع , حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword(
      String email, String password, context) async {
    try {
      var user = await fireBaseServices.signInWithEmailAndPassword(
        email: email,
        password: password,
        context: context,
      );

      UserEntity userEntity =
          await getUserData(path: 'UsersData', uid: user.uid);

      await getIt<AuthRepo>().saveData(userEntity: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(Failuer(message: e.message));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await fireBaseServices.signInWithGoogle();

      bool checkData = await searchUser(path: 'UsersData', uid: user.uid);
      if (!checkData) {
        await addUserData(userEntity: UserModel.fromFirebase(user));
      }
      UserEntity userEntity =
          await getUserData(path: 'UsersData', uid: user.uid);

      await getIt<AuthRepo>().saveData(userEntity: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await fireBaseServices.deleteAccount();
      }
      return left(Failuer(message: e.message));
    } catch (e) {
      if (user != null) {
        await fireBaseServices.deleteAccount();
      }
      return left(Failuer(message: 'حدث خطأ غير متوقع , حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithFacebook() async {
    try {
      var user = await fireBaseServices.signInWithFacebook();
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(Failuer(message: e.message));
    } catch (e) {
      return left(Failuer(message: 'حدث خطأ غير متوقع , حاول مرة اخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    try {
      await databaseServices.addData(userEntity.uid,
          path: 'UsersData', data: userEntity.toMap());
    } catch (e) {
      throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
    }
  }

  @override
  Future<bool> searchUser({required String path, required String uid}) async {
    bool value = await databaseServices.searchUser(path: path, uid: uid);
    return value;
  }

  @override
  Future<UserEntity> getUserData(
      {required String path, required String uid}) async {
    return UserModel.fromFireStore(
        await databaseServices.getData(path: path, documentId: uid));
  }

  @override
  Future saveData({required UserEntity userEntity}) async {
    var jsonData = jsonEncode(userEntity.toMap());
    await getIt<CacheHelper>().saveData(key: 'userData', value: jsonData);
  }

  @override
  Future deleteData() async {
    await getIt<CacheHelper>().removeData(key: 'userData');
  }
}
