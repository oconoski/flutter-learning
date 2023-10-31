class User {
  User({
    this.id,
    required this.name,
    required this.username,
    required this.password,
  });

  int? id;
  String name;
  String username;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'password': password,
      };

  User copy({
    int? id,
    String? name,
    String? username,
    String? password,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        password: password ?? this.password,
      );
}
