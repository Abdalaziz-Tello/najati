class GetCharacters {
  final String status;
  final String message;
  final List<Character> data;

  GetCharacters({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetCharacters.fromJson(Map<String, dynamic> json) {
    return GetCharacters(
      status: json['status'],
      message: json['message'],
      data: List<Character>.from(
        json['data'].map((item) => Character.fromJson(item)),
      ),
    );
  }
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
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}
