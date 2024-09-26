// ignore_for_file: file_names

class UserEntity {
  final String email;
  final String name;
  final String uid;

  UserEntity({required this.email, required this.name, required this.uid});

  toMap() {
    return {
      "email": email,
      "name": name,
      "uid": uid,
    };
  }
}
