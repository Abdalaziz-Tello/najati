class GetChildrenResponse {
  final String status;
  final String message;
  final List<Child> data;

  GetChildrenResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetChildrenResponse.fromJson(Map<String, dynamic> json) {
    return GetChildrenResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((child) => Child.fromJson(child))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.map((child) => child.toJson()).toList(),
  };
}

class Child {
  final int id;
  final String name;
  final String gender;
  final String image;
  final int points;
  final String birthDate;
  final Character? character;

  Child({
    required this.id,
    required this.name,
    required this.gender,
    required this.image,
    required this.points,
    required this.birthDate,
    this.character,
  });

  factory Child.fromJson(Map<String, dynamic> json) {
    final characterData = json['character'];

    return Child(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      points: json['points'] as int,
      birthDate: json['birth_date'] as String,
      character:
          (characterData is Map<String, dynamic>)
              ? Character.fromJson(characterData)
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'gender': gender,
    'image': image,
    'points': points,
    'birth_date': birthDate,
    'character': character?.toJson() ?? [],
  };
}

class Character {
  final int id;
  final String name;
  final String price;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'image': image,
  };
}
