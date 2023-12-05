class Poke {
  Poke({
    this.id,
    required this.name,
    required this.image,
  });

  int? id;
  String name;
  String image;

  factory Poke.fromJson(Map<String, dynamic> json) => Poke(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };

  Poke copy({
    int? id,
    String? name,
    String? image,
  }) =>
      Poke(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );
}
