class FivePrayersResponse {
  final String status;
  final List<Prayer> data;

  FivePrayersResponse({required this.status, required this.data});

  factory FivePrayersResponse.fromJson(Map<String, dynamic> json) {
    return FivePrayersResponse(
      status: json['status'],
      data:
          (json['data'] as List).map((item) => Prayer.fromJson(item)).toList(),
    );
  }
}

class Prayer {
  final int id;
  final String name;
  final String type;

  Prayer({required this.id, required this.name, required this.type});

  factory Prayer.fromJson(Map<String, dynamic> json) {
    return Prayer(id: json['id'], name: json['name'], type: json['type']);
  }
}
