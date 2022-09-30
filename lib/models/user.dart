class User {
  final String id;
  final String name;
  final String avatar;
  final String email;
  final String password;

  const User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      email: json['email'],
      password: json['password'],
    );
  }
}
