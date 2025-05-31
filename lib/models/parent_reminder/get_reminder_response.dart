class GetReminderResponse {
  final String status;
  final List<ReminderData> data;

  GetReminderResponse({required this.status, required this.data});

  factory GetReminderResponse.fromJson(Map<String, dynamic> json) {
    return GetReminderResponse(
      status: json['status'],
      data:
          (json['data'] as List)
              .map((item) => ReminderData.fromJson(item))
              .toList(),
    );
  }
}

class ReminderData {
  final int id;
  final Prayer prayer;
  final int minutes;

  ReminderData({required this.id, required this.prayer, required this.minutes});

  factory ReminderData.fromJson(Map<String, dynamic> json) {
    return ReminderData(
      id: json['id'],
      prayer: Prayer.fromJson(json['prayer']),
      minutes: json['minutes'],
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
