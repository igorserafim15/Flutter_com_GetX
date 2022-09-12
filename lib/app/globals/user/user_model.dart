class User {
  String? email;
  String? name;
  String? phone;
  String? password;
  String? cpf;
  String? id;
  String? token;

  User({
    this.email,
    this.name,
    this.phone,
    this.password,
    this.cpf,
    this.id,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      email: json['email'],
      name: json['fullname'],
      phone: json['phone'],
      password: json['password'],
      cpf: json['cpf'],
      id: json['id'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullname': name,
      'phone': phone,
      'password': password,
      'cpf': cpf,
      'id': id,
      'token': token,
    };
  }
}
