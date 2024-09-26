import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/service/dataBase_services.dart';

class FireStoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
    String? documentId, {
    required String path,
    required Map<String, dynamic> data,
  }) async {
    if (documentId != null) {
      await firestore
          .collection(path)
          .doc(documentId)
          .set(data, SetOptions(merge: true));
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> searchUser({required String path, required String uid}) async {
    QuerySnapshot querySnapshot =
        await firestore.collection(path).where('uid', isEqualTo: uid).get();

    if (querySnapshot.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    try {
      DocumentSnapshot documentSnapshot =
          await firestore.collection(path).doc(documentId).get();

      Map<String, dynamic> doc =
          documentSnapshot.data() as Map<String, dynamic>;
      return doc;
    } catch (e) {
      log(e.toString());
      throw CustomException(message: 'حدث خطأ غير متوقع , حاول مرة اخرى');
    }
  }
}
