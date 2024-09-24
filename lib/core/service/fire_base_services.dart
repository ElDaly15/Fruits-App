import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/exceptions.dart';

class FireBaseServices {
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
      return FirebaseAuth.instance.currentUser!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الباسورد الخاص بك ضعيف برجاء تغيرو');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'الايميل الذي ادخلته مستخدم من قبل برجاء تسجيل الدخول');
      } else {
        throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
      }
    } catch (e) {
      throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == e.code) {
        throw CustomException(message: 'كلمه المرور او الايميل غير صحيحه');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور خاطئة');
      } else {
        throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
      }
    } catch (e) {
      throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
    }
  }
}
