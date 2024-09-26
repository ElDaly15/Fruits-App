// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

abstract class DatabaseServices {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data});
}
