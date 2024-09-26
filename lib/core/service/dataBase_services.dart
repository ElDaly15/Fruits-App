// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

abstract class DatabaseServices {
  Future<void> addData(
    String? documentId, {
    required String path,
    required Map<String, dynamic> data,
  });

  Future<bool> searchUser({required String path, required String uid});

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});
}
