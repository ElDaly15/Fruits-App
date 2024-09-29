import 'dart:convert';

import 'package:fruits_app/core/db/cached_helper.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/featuers/auth/data/models/user_model.dart';
import 'package:fruits_app/featuers/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var userData = getIt<CacheHelper>().getData(key: 'userData');
  UserEntity userEntity = UserModel.fromFireStore(jsonDecode(userData));

  return userEntity;
}
