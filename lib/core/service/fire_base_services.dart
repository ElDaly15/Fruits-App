// ignore_for_file: use_build_context_synchronously, duplicate_ignore
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_app/core/db/cached_helper.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/widgets/custom_snack_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseServices {
  Future deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Create the user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.updateDisplayName(name);
      await credential.user!.reload();
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      return FirebaseAuth.instance.currentUser!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الباسورد الخاص بك ضعيف برجاء تغيرو');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'الايميل الذي ادخلته مستخدم من قبل برجاء تسجيل الدخول');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالانترنت. برجاء المحاولة لاحقاً.');
      } else {
        throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
      }
    } on SocketException {
      // Handle no internet connection
      throw CustomException(
          message: 'لا يوجد اتصال بالانترنت. برجاء المحاولة لاحقاً.');
    } catch (e) {
      throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Sign in the user
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        getIt<CustomSnackBar>().showCustomSnackBar(
            message: 'يرجى التحقق من بريدك الالكتروني',
            // ignore: use_build_context_synchronously
            context: context,
            type: AnimatedSnackBarType.warning);
      }

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == e.code &&
          e.code != 'too-many-requests' &&
          e.code != 'network-request-failed') {
        throw CustomException(
            message: 'كلمة المرور او البريد الالكتروني خاطئة');
      } else if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'لا يوجد مستخدم مسجل بهذا البريد الإلكتروني');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
            message: 'برجاء الانتظار لحظة واحدة قبل اعاده المحاوله');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالانترنت. برجاء المحاولة لاحقاً.');
      } else {
        throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
      }
    } on SocketException {
      // Handle no internet connection
      throw CustomException(
          message: 'لا يوجد اتصال بالانترنت. برجاء المحاولة لاحقاً.');
    } catch (e) {
      throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
    }
  }

  Future<void> sendPasswordResetEmail(
      String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      getIt<CustomSnackBar>().showCustomSnackBar(
          message: 'تم ارسال رابط اعاده تعيين كلمه المرور بنجاح',
          context: context,
          type: AnimatedSnackBarType.success);
    } catch (error) {
      getIt<CustomSnackBar>().showCustomSnackBar(
          message: 'حدث خطأ غير متوقع , حاول مرة اخرى',
          context: context,
          type: AnimatedSnackBarType.error);
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().disconnect();
    }
    await getIt<CacheHelper>().removeData(key: 'userData');
  }
}
