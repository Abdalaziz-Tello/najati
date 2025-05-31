class CreateChildResponse {
  final String status;
  final String message;
  final Child data;

  CreateChildResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateChildResponse.fromJson(Map<String, dynamic> json) {
    return CreateChildResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: Child.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data.toJson()};
  }
}

class Child {
  final int id;
  final String name;
  final String gender;
  final String image;
  final int points;
  final String birthDate;
  final List<dynamic> character;

  Child({
    required this.id,
    required this.name,
    required this.gender,
    required this.image,
    required this.points,
    required this.birthDate,
    required this.character,
  });

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      points: json['points'] as int,
      birthDate: json['birth_date'] as String,
      character: json['character'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'image': image,
      'points': points,
      'birth_date': birthDate,
      'character': character,
    };
  }
}
