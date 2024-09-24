// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:fruits_app/featuers/auth/domain/entites/user_entity.dart';
import 'package:fruits_app/featuers/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.authRepo) : super(CreateUserInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(CreateUserLoading());
    var result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failuer) => emit(CreateUserFailuer(message: failuer.message)),
      (user) => emit(CreateUserSuccess(userEntity: user)),
    );
  }
}
