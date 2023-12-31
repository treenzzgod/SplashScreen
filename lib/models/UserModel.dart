class UserModel {
  String? user_id;
  String? user_name;
  String? password;

  UserModel(user_id, user_name, password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'password': password
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    user_name = map['user_name'];
    password = map['password'];
  }
}
