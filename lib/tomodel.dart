class Usermodels {
  int? id;
  final String username;
  final String number;
  final String password;

  Usermodels(
      {this.id,
      required this.username,
      required this.number,
      required this.password});

  factory Usermodels.frommap(Map<String, dynamic> map) {
    return Usermodels(
        id: map['id'],
        username: map['username'],
        number: map['phonenumber'],
        password: map['password']);
  }
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'phonenumber': number,
      'password': password,
    };
  }
}

List<Usermodels> userfromMap(List<Map<String, dynamic>> fromMap) {
  return List<Usermodels>.from(
      fromMap.map((e) => Usermodels.frommap(e)).toList());
}
