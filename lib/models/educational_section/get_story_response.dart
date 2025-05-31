class GetStoryResponse {
  final String status;
  final List<Story> data;

  GetStoryResponse({required this.status, required this.data});

  factory GetStoryResponse.fromJson(Map<String, dynamic> json) {
    return GetStoryResponse(
      status: json['status'],
      data: (json['data'] as List).map((item) => Story.fromJson(item)).toList(),
    );
  }
}

class Story {
  final int id;
  final String name;
  final String price;
  final String image;
  final CharacterData characterData;
  final List<String> characterImages;
  final CharacterSound characterSound;

  Story({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.characterData,
    required this.characterImages,
    required this.characterSound,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      characterData: CharacterData.fromJson(json['character_data']),
      characterImages: List<String>.from(json['character_images']),
      characterSound: CharacterSound.fromJson(json['character_sound']),
    );
  }
}

class CharacterData {
  final List<String> explanations;
  final List<String> partitions;

  CharacterData({required this.explanations, required this.partitions});

  factory CharacterData.fromJson(Map<String, dynamic> json) {
    return CharacterData(
      explanations: List<String>.from(json['explanations']),
      partitions: List<String>.from(json['partitions']),
    );
  }
}

class CharacterSound {
  final String sound;

  CharacterSound({required this.sound});

  factory CharacterSound.fromJson(Map<String, dynamic> json) {
    return CharacterSound(sound: json['sound']);
  }
}
