class UserModel{
  final String? id;
  final String name;
  final String email;
  final String gender;
  final String age;
  final String password;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.password,
});

  toJson(){
    return {
      "name": name,
      "email": email,
      "gender": gender,
      "age": age,
      "password": password,
    };
  }
}