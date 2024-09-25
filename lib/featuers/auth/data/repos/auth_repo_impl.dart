import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/core/service/fire_base_services.dart';
import 'package:fruits_app/featuers/auth/data/models/user_model.dart';
import 'package:fruits_app/featuers/auth/domain/repos/auth_repo.dart';
import '../../domain/entites/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseServices fireBaseServices;

  AuthRepoImpl({required this.fireBaseServices});

  @override
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await fireBaseServices.createUserWithEmailAndPassword(
          email: email, password: password, name: name);

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
}
