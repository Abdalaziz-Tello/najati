class GetAllStoriesResponse {
  final String status;
  final List<EducationalSection> data;

  GetAllStoriesResponse({required this.status, required this.data});

  factory GetAllStoriesResponse.fromJson(Map<String, dynamic> json) {
    return GetAllStoriesResponse(
      status: json['status'],
      data:
          (json['data'] as List)
              .map((item) => EducationalSection.fromJson(item))
              .toList(),
    );
  }
}

class EducationalSection {
  final int id;
  final String name;
  final String image;

  EducationalSection({
    required this.id,
    required this.name,
    required this.image,
  });

  factory EducationalSection.fromJson(Map<String, dynamic> json) {
    return EducationalSection(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
