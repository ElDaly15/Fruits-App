// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/featuers/auth/domain/entites/user_entity.dart';
import 'package:fruits_app/featuers/auth/domain/repos/auth_repo.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.authRepo) : super(LoginUserInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginUserLoading());
    var result =
        await authRepo.signInWithEmailAndPassword(email, password, context);
    result.fold(
      (failuer) => emit(LoginUserFailuer(message: failuer.message)),
      (user) => emit(LoginUserSuccess(userEntity: user)),
    );
  }
}
