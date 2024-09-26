import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/errors/failuer.dart';
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
    try {
      var user = await fireBaseServices.createUserWithEmailAndPassword(
          email: email, password: password, name: name);

      await addUserData(userEntity: UserModel.fromFirebase(user));

      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(Failuer(message: e.message));
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
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(Failuer(message: e.message));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithGoogle() async {
    try {
      var user = await fireBaseServices.signInWithGoogle();
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(Failuer(message: e.message));
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
      await databaseServices.addData(
          path: 'UsersData', data: userEntity.toMap());
    } catch (e) {
      throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
    }
  }
}
